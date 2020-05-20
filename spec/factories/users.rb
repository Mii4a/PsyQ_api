# frozen_string_literal: true

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
