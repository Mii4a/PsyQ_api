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

psychologies = [
  {
    category: 'basic',
    field: 'learning',
    japanese_field_name: '学習',
    explanation: 'ヒトを含めた動物が経験を通じて行動を変容させる過程を研究する領域',
    font_awesome_icon: 'dog'
  },
  {
    category: 'basic',
    field: 'physiological',
    japanese_field_name: '生理',
    explanation: '生理機能をもとに心理的機能との対応関係を研究する領域',
    font_awesome_icon: 'brain'
  },
  {
    category: 'basic',
    field: 'social',
    japanese_field_name: '社会',
    explanation: '個人に対する社会活動や相互的影響関係を研究する領域',
    font_awesome_icon: 'people-arrows'
  },
  {
    category: 'applied',
    field: 'clinical',
    japanese_field_name: '臨床',
    explanation: '精神障害や心身症、心理的な問題や不適応行動などの援助、回復、予防、その研究を目的とする領域',
    font_awesome_icon: 'hand-holding-heart'
  },
  {
    category: 'applied',
    field: 'educational',
    japanese_field_name: '教育',
    explanation: '成長過程を心理学的視点から見つめ、効果的な教育方法を研究する領域',
    font_awesome_icon: 'chalkboard-teacher'
  }
]
psychologies.each do |n|
  Psychology.create!(
    category: n[:category],
    field: n[:field],
    japanese_field_name: n[:japanese_field_name],
    explanation: n[:explanation],
    font_awesome_icon: n[:font_awesome_icon]
  )
end

basic_psychology = Psychology.find_by(category: 'basic')
(1..3).each do |n|
  basic_psychology.workbooks.create!(
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
