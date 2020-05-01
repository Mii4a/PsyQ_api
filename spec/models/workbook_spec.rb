require 'rails_helper'

RSpec.describe Workbook, type: :model do
  let(:workbook){ create(:psychology) }

  context 'when #subject_name is blank' do
    it 'is invalid' do
      workbook.subject_name = '   '
      expect(workbook).to be_invalid
    end
  end

  context 'when #subject_explanation is blank' do
    it 'is invalid' do
      workbook.subject_name = '   '
      expect(workbook).to be_invalid
    end
  end
end
