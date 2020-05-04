# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  let(:workbook) { create(:workbook) }

  let(:valid_attributes) do
    { question: {
      explanation: 'test explanation',
      workbook_id: workbook.id
    } }
  end

  let(:invalid_attributes) do
    { question: {
      explanation: '   ',
      workbook_id: nil
    } }
  end

  let(:headers_authorization) do
    { 'Authorization': 'Token ' + ENV.fetch('API_TOKEN') }
  end

  describe 'GET /api/v1/questions' do
    context 'with authorization' do
      it 'renders a JSON response with all questions' do
        get api_v1_questions_path,
            headers: headers_authorization,
            as: :json
        expect(response).to have_http_status(200)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'without authorization' do
      it 'renders a JSON response with errors for invalid token' do
        get api_v1_questions_path,
            as: :json
        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to include('token invalid')
      end
    end
  end

  describe 'POST /api/v1/questions' do
    context 'with valid attributes and the authorization' do
      it 'creates a new Question' do
        expect do
          post api_v1_questions_path,
               params: valid_attributes,
               headers: headers_authorization,
               as: :json
        end.to change(Question, :count).by(1)
      end

      it 'renders a JSON response with the new Question' do
        post api_v1_questions_path,
             params: valid_attributes,
             headers: headers_authorization,
             as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new Question' do
        expect do
          post api_v1_questions_path,
               params: invalid_attributes,
               headers: headers_authorization,
               as: :json
        end.to change(Question, :count).by(0)
      end

      it 'renders a JSON response with errors for the new Question' do
        post api_v1_questions_path,
             params: invalid_attributes,
             headers: headers_authorization,
             as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'without the authorization' do
      it 'renders the response to have status code :unauthorized' do
        post api_v1_questions_path,
             params: valid_attributes,
             as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'with authorization' do
      it 'destroys the requested workbook' do
        workbook = Workbook.create!(
          subject_name: 'test name',
          subject_explanation: 'test explanation'
        )
        expect do
          delete api_v1_workbook_path(workbook),
                 headers: headers_authorization,
                 as: :json
        end.to change(Workbook, :count).by(-1)
      end
    end

    context 'without authorization' do
      it 'destroys the requested question' do
        question = Question.create!(
          explanation: 'test name',
          workbook_id: workbook.id
        )
        expect do
          delete api_v1_question_path(question),
                 as: :json
        end.to change(Question, :count).by(0)
      end
    end
  end
end
