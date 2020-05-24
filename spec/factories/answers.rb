# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  is_answer   :boolean
#  option      :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer          not null
#
# Indexes
#
#  index_answers_on_option       (option)
#  index_answers_on_question_id  (question_id)
#
# Foreign Keys
#
#  question_id  (question_id => questions.id)
#
FactoryBot.define do
  factory :answer do
    option { "MyText" }
    is_answer { false }
    question { nil }
  end
end
