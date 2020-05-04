class Question < ApplicationRecord
  belongs_to :workbook
  validates :explanation, presence: true
  validates :workbook, presence: true
end
