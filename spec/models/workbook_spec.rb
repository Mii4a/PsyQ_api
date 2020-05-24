# frozen_string_literal: true

# == Schema Information
#
# Table name: workbooks
#
#  id                  :integer          not null, primary key
#  questions_count     :integer          default(0), not null
#  subject_explanation :text
#  subject_image       :string
#  subject_name        :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  psychology_id       :integer
#
require 'rails_helper'

RSpec.describe Workbook, type: :model do
  let(:workbook) { create(:workbook) }

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
