FactoryBot.define do
  factory :workbook, class: Workbook do
    subject_name { 'psychology' }
    subject_explanation { '心理学の問題集' }
  end
end
