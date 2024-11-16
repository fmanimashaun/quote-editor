puts "\n== Seeding quotes =="

require 'factory_bot_rails'

# Create 10 quotes with Faker data
2.times do
  FactoryBot.create(:quote)
end

puts "Seeding quotes complete! Created 10 quotes."
