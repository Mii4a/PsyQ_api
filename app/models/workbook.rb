# frozen_string_literal: true

class Workbook < ApplicationRecord
  has_many :preference_relationships, dependent: :destroy
  has_many :users_added_to_preference, through: :preference_relationships,
                                       source: :user
  validates :subject_name, presence: true, uniqueness: true
  validates :subject_explanation, presence: true
end
