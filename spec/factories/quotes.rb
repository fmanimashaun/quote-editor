FactoryBot.define do
  factory :quote do
    name { Faker::Quote.famous_last_words }
    association :company
  end
end
