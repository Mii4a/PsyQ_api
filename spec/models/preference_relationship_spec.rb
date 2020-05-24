# frozen_string_literal: true

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
require 'rails_helper'

RSpec.describe PreferenceRelationship, type: :model do
  let(:preference_relationship) { create(:preference_relationship) }

  context 'when #user_id is nil' do
    it 'is invalid' do
      preference_relationship.user_id = nil
      expect(preference_relationship).to be_invalid
    end
  end

  context 'when #workbook_id is nil' do
    it 'is invalid' do
      preference_relationship.workbook_id = nil
      expect(preference_relationship).to be_invalid
    end
  end
end
