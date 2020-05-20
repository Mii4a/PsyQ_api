class Psychology < ApplicationRecord
  has_many :workbooks, dependent: :destroy
  validates :category, presence: true
  validates :explanation, presence: true
  validates :field, presence: true
end
