# frozen_string_literal: true

class Workbook < ApplicationRecord
  validates :subject_name, presence: true, uniqueness: true
  validates :subject_explanation, presence: true
end
