# frozen_string_literal: true

class PreferenceRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :workbook
  validates :user_id, presence: true
  validates :workbook_id, presence: true
end
