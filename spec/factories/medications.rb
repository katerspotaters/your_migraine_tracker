FactoryGirl.define do
  factory :medication do
    name Faker::Hipster.word
    dosage_amount Faker::Number.between(1, 5)
    dosage_measurement "mg"
    frequency_amount Faker::Number.between(1, 10)
    frequency_measurement "at night"
    user
  end
end
