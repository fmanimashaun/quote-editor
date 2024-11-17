puts "\n== Seeding the database =="

# Load specific seed files
load Rails.root.join('db/seeds/companies_users_quotes.rb')

puts "Seeding complete!"
