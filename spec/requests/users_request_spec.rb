# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:valid_headers) do
    { 'Authorization': 'Token ' + ENV.fetch('API_TOKEN') }
  end

  describe 'GET /api/v1/users' do
    it 'User一覧を取得する' do
      get api_v1_users_path, headers: valid_headers
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/v1/users' do
    context 'with valid params and HTTP headers' do
      it 'succeeds to create user' do
        expect do
          post '/api/v1/users',
               params: { user: {
                 name: 'test user',
                 email: 'test@example.com',
                 password: 'password',
                 password_confirmation: 'password'
               } },
               headers: valid_headers
        end.to change(User, :count).by(1)
      end
    end
  end
end
