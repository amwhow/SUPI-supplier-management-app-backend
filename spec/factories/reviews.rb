FactoryBot.define do
  factory :review do
    qualityRating { 1 }
    reliabilityRating { 1 }
    costRating { 1 }
    comment { "MyText" }
  end
end
