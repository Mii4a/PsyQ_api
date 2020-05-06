FactoryBot.define do
  factory :answer do
    option { "MyText" }
    is_answer { false }
    question { nil }
  end
end
