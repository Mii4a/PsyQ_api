class Workbook < ApplicationRecord
  validates :subject_name, presence: true
  validates :subject_explanation, presence: true
end
