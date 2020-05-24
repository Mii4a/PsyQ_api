# frozen_string_literal: true

class Workbook < ApplicationRecord
  belongs_to :psychology
  has_many :preference_relationships, dependent: :destroy
  has_many :users_added_to_preference, through: :preference_relationships,
                                       source: :user
  has_many :questions, dependent: :destroy
  validates :subject_name, presence: true, uniqueness: true
  validates :subject_explanation, presence: true

end

# == Schema Information
#
# Table name: workbooks
#
#  id                  :integer          not null, primary key
#  questions_count     :integer          default(0), not null
#  subject_explanation :text
#  subject_image       :string
#  subject_name        :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  psychology_id       :integer
#
