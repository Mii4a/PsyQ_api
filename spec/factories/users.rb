# frozen_string_literal: true

FactoryBot.define do
  sequence(:name) { |n| "user_#{n}" }
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user, class: User do
    name
    email
    password { 'password' }
  end
end
