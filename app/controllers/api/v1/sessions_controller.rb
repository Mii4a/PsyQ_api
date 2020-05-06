# frozen_string_literal: true

class Api::V1::SessionsController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]

  def create
    @user = User.find_by!(email: params[:session][:email].downcase)
    if @user.authenticate(params[:session][:password])
      payload = { user_id: @user.id }
      session = JWTSessions::Session.new(payload: payload,
                                         refresh_by_access_allowed: true)
      token = session.login
      response.set_cookie(JWTSession.access_cookie,
                          value: token[:access],
                          httponly: true,
                          secure: Rails.env.production?)
      render json: { csrf: token[:csrf] }
    else
      not_found
    end
  end

  def destroy
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
    render json: :success
  end

  private

  def not_found
    render json: { error: 'Cannot find email/password combination' },
           status: :not_found
  end
end
