# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  explanation :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  workbook_id :integer
#
# Indexes
#
#  index_questions_on_workbook_id  (workbook_id)
#
require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { create(:question) }

  context 'when #explanation is blank' do
    it 'is invalid' do
      question.explanation = '   '
      expect(question).to be_invalid
    end
  end

  context 'when #workbook is nil' do
    it 'is invalid' do
      question.workbook = nil
      expect(question).to be_invalid
    end
  end
end
