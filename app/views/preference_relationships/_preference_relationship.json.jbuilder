# frozen_string_literal: true

json.extract! preference_relationship, :user_id, :workbook_id, :updated_at, :created_at
json.url preference_relationship_url(preference_relationship, format: :json)
