# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :workbook
  has_many :answers, dependent: :destroy
  validates :explanation, presence: true
  validates :workbook, presence: true
  counter_culture :workbook
end

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
