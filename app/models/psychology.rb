class Psychology < ApplicationRecord
  has_many :workbooks, dependent: :destroy
  validates :category, presence: true
  validates :explanation, presence: true
  validates :field, presence: true
  validates :font_awesome_icon, presence: true
  validates :japanese_field_name, presence: true
end
