# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /api/v1/users' do
    subject { get(api_v1_users_path) }
    before { create_list(:user, 3) }

    it 'User一覧を取得する' do
      subject
      expect(response).to have_http_status(401)
    end
  end

  describe "POST /api/v1/users" do
    
  end
end
