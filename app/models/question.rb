# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :workbook
  has_many :answers, dependent: :destroy
  validates :explanation, presence: true
  validates :workbook, presence: true
end
