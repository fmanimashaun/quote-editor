require_relative './user_data'

# Create companies and users based on the loaded data
USERS.group_by { |user| user[:company] }.each do |company_name, company_users|
  # Create the company
  company = FactoryBot.create(:company, name: company_name)

  # Create users for this company
  company_users.each do |user_data|
    FactoryBot.create(:user, email: user_data[:email], password: user_data[:password], company: company)
  end

  # Create 5 quotes for the company
  5.times do
    FactoryBot.create(:quote, name: Faker::Quote.famous_last_words, company: company)
  end
end

puts "Seeding complete! Created #{USERS.map { |u| u[:company] }.uniq.size} companies, #{USERS.size} users, and #{USERS.map { |u| u[:company] }.uniq.size * 5} quotes."
