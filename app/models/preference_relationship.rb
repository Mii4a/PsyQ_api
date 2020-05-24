# frozen_string_literal: true

class PreferenceRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :workbook
  validates :user_id, presence: true
  validates :workbook_id, presence: true
end

# == Schema Information
#
# Table name: preference_relationships
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  workbook_id :integer
#
# Indexes
#
#  index_preference_relationships_on_user_id                  (user_id)
#  index_preference_relationships_on_user_id_and_workbook_id  (user_id,workbook_id) UNIQUE
#  index_preference_relationships_on_workbook_id              (workbook_id)
#
