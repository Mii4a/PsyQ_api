# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  explanation :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  workbook_id :integer
#
# Indexes
#
#  index_questions_on_workbook_id  (workbook_id)
#
FactoryBot.define do
  factory :question do
    explanation { 'MyText' }
    association :workbook
  end
end
