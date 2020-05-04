# frozen_string_literal: true

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
