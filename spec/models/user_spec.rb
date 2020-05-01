# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  context 'when #name is blank' do
    it 'is invalid' do
      user.name = '   '
      expect(user).to be_invalid
    end
  end

  context 'when #email is blank' do
    it 'is invalid' do
      user.email = '   '
      expect(user).to be_invalid
    end
  end

  context 'when #password is blank' do
    it 'is invalid' do
      user.password = '   '
      expect(user).to be_invalid
    end
  end
end
