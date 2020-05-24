class Psychology < ApplicationRecord
  has_many :workbooks, dependent: :destroy
  validates :category, presence: true
  validates :explanation, presence: true
  validates :field, presence: true
  validates :font_awesome_icon, presence: true
  validates :japanese_field_name, presence: true
end

# == Schema Information
#
# Table name: psychologies
#
#  id                  :integer          not null, primary key
#  category            :string
#  explanation         :text
#  field               :string
#  font_awesome_icon   :string
#  japanese_field_name :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_psychologies_on_category     (category)
#  index_psychologies_on_explanation  (explanation)
#
