# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |n|
  User.create!(
    name: "example_user#{n + 1}",
    email: "example#{n + 1}@user.com",
    password: 'password',
    password_confirmation: 'password'
  )
end

Workbook.create!(
  subject_name: 'test workbook',
  subject_explanation: 'this is test workbook'
)
