# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  is_admin        :boolean          default(FALSE)
#  name            :string
#  password_digest :string
#  token           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_token  (token) UNIQUE
#
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
