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
FactoryBot.define do
  factory :user, class: User do
    sequence(:name) { |n| "user_#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
  end

  factory :admin_user, class: User do
    name {'admin_user'}
    email {'admin@user.com'}
    password {'password'}
    is_admin {true}
  end
end
