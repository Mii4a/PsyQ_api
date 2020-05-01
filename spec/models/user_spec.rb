# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:alice) { create(:alice) }

  context 'when #name is blank' do
    it 'is invalid' do
      alice.name = '   '
      expect(alice).to be_invalid
    end
  end

  context 'when #email is blank' do
    it 'is invalid' do
      alice.email = '   '
      expect(alice).to be_invalid
    end
  end

  context 'when #password is blank' do
    it 'is invalid' do
      alice.password = '   '
      expect(alice).to be_invalid
    end
  end
end
