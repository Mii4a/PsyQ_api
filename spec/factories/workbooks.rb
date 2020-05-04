FactoryBot.define do
  factory :workbook, class: Workbook do
    subject_name { 'test workbook' }
    subject_explanation { 'This is an workbook' }
  end
end
