require 'rails_helper'

describe Company, type: :model do
  context 'associations' do
    it 'has many users with dependent destroy' do
      company = create(:company)
      user1 = create(:user, company: company)
      user2 = create(:user, company: company)

      expect(company.users).to include(user1, user2)
      expect { company.destroy }.to change { User.count }.by(-2)
    end

    it 'has many quotes with dependent destroy' do
      company = create(:company)
      quote1 = create(:quote, company: company)
      quote2 = create(:quote, company: company)

      expect(company.quotes).to include(quote1, quote2)
      expect { company.destroy }.to change { Quote.count }.by(-2)
    end
  end

  context 'validations' do
    it 'validates presence of name' do
      company = build(:company, name: nil)
      expect(company).not_to be_valid
      expect(company.errors[:name]).to include("can't be blank")
    end
  end
end
