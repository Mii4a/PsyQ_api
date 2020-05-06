# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: 'example_user',
  email: 'example@user.com',
  password: 'password',
  password_confirmation: 'password',
  is_admin: true
)

(2..20).each do |n|
  User.create!(
    name: "example_user#{n}",
    email: "example#{n}@user.com",
    password: 'password',
    password_confirmation: 'password'
  )
end

(1..3).each do |n|
  Workbook.create!(
    subject_name: "test workbook #{n}",
    subject_explanation: "this is test workbook #{n}"
  )
end

workbooks = Workbook.order(:created_at).take(3)
workbooks.each do |workbook|
  (1..5).each do |n|
    workbook.questions.create!(
      explanation: "Here is test question data #{n}"
    )
  end
end

questions = Question.all.take(15)
questions.each do |question|
  (1..3).each do |n|
    if (n % 3).zero?
      question.answers.create!(
        option: "test answer #{n}",
        is_answer: true
      )
    else
      question.answers.create!(
        option: "test answer #{n}",
        is_answer: false
      )
    end
  end
end
