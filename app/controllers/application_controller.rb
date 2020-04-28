# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate
  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      token == ENV.fetch('API_TOKEN')
    end
  end
end
