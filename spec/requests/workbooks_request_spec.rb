# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Workbooks', type: :request do
  describe 'GET /index' do
    it 'works! (now write some real specs)' do
      get '/api/v1/users'
      expect(response).to have_http_status(401)
    end
  end
end
