# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    explanation { 'MyText' }
    association :workbook
  end
end
