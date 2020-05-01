# frozen_string_literal: true

FactoryBot.define do
  factory :alice, class: User do
    name  { 'Alice' }
    email { 'Alice@example.com' }
    password { 'password' }
  end
end
