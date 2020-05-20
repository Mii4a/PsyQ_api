# frozen_string_literal: true

class Workbook < ApplicationRecord
  belongs_to :psychology
  has_many :preference_relationships, dependent: :destroy
  has_many :users_added_to_preference, through: :preference_relationships,
                                       source: :user
  has_many :questions, dependent: :destroy
  validates :subject_name, presence: true, uniqueness: true
  validates :subject_explanation, presence: true
  mount_base64_uploader :subject_image, SubjectImageUploader

end
