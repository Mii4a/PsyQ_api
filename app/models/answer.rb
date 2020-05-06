# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  validates :option, presence: true
  validates :question, presence: true
end
