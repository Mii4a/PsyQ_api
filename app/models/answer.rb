# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  validates :option, presence: true
  validates :is_answer, presence: true
  validates :question, presence: true
end

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
