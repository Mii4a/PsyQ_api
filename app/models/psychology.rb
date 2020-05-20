class Psychology < ApplicationRecord
  has_many :workbooks
  validates :category, presence: true
  validates :explanation, presence: true
end
