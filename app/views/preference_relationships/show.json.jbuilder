# frozen_string_literal: true

json.extract! @preference_relationship, :user_id, :workbook_id, :created_at, :updated_at
json.partial! 'preference_relationships/preference_relationship', preference_relationship: @preference_relationship
