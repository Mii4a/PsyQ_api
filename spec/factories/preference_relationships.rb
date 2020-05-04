# frozen_string_literal: true

FactoryBot.define do
  factory :preference_relationship, class: PreferenceRelationship do
    association :user, factory: :user
    association :workbook, factory: :workbook
  end
end
