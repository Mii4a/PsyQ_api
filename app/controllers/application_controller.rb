# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
  before_action :authenticate

  private

  def current_user
    @current_user ||= User.find(payload[:user_id])
  end

  def current_user?(_user)
    _user = current_user
  end

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      token == ENV.fetch('API_TOKEN')
    end
  end

  def render_unauthorized
    # render_errors(:unauthorized, ['invalid token'])
    obj = { message: 'token invalid' }
    render json: obj, status: :unauthorized
  end

  def not_authorized
    render json: { error: 'Not authorized ' }, status: :unauthorized
  end
end
