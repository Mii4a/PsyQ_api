# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/preference_relationships', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # PreferenceRelationship. As you add validations to PreferenceRelationship, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { preference_relationship: { user_id: user.id, workbook_id: workbook.id } }
  end

  let(:invalid_attributes) do
    { preference_relationship: { user_id: nil, workbook_id: nil } }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # PreferenceRelationshipsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:headers_authorization) do
    { 'Authorization': 'Token ' + ENV.fetch('API_TOKEN') }
  end

  # Test User
  let(:user) { create(:user) }

  # Test Workbook
  let(:workbook) { create(:workbook) }

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new PreferenceRelationship' do
        expect do
          post '/api/v1/login', params: {
            session: {
              email: user.email,
              password: user.password
            }
          }
          post api_v1_preference_relationships_path,
               params: valid_attributes,
               headers: headers_authorization,
               as: :json
        end.to change(PreferenceRelationship, :count).by(1)
      end

      it 'renders a JSON response with the new preference_relationship' do
        post api_v1_preference_relationships_path,
             params: valid_attributes,
             headers: headers_authorization,
             as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new PreferenceRelationship' do
        expect do
          post api_v1_preference_relationships_path,
               params: invalid_attributes,
               headers: headers_authorization,
               as: :json
        end.to change(PreferenceRelationship, :count).by(0)
      end

      it 'renders a JSON response with errors for the new preference_relationship' do
        post api_v1_preference_relationships_path,
             params: invalid_attributes,
             headers: headers_authorization,
             as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'without authorizattion in headers' do
      it 'return the response to have status code :unauthorized' do
        post api_v1_preference_relationships_path,
             params: valid_attributes,
             as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested preference_relationship' do
      preference_relationship = PreferenceRelationship.create!(
        user_id: user.id,
        workbook_id: workbook.id
      )
      expect do
        delete api_v1_preference_relationship_path(preference_relationship),
               headers: headers_authorization,
               as: :json
      end.to change(PreferenceRelationship, :count).by(-1)
    end

    context 'without authorization' do
      it 'destroys the requested workbook' do
        preference_relationship = PreferenceRelationship.create!(
          user_id: user.id,
          workbook_id: workbook.id
        )
        expect do
          delete api_v1_preference_relationship_path(preference_relationship),
                 as: :json
        end.to change(PreferenceRelationship, :count).by(0)
      end
    end
  end
end
