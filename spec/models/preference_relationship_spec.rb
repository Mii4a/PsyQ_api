# frozen_string_literal: true

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
