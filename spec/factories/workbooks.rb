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
FactoryBot.define do
  factory :workbook, class: Workbook do
    subject_name { 'test workbook' }
    subject_explanation { 'This is an workbook' }
  end
end
