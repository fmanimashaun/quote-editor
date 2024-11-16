puts "\n== Seeding the database =="

# Load specific seed files
load Rails.root.join('db/seeds/quotes.rb')

puts "Seeding complete!"
