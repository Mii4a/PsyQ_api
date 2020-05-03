# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :workbook
  validates :question_explanation, presence: true
  validates :workbook_id, presence: true
end
