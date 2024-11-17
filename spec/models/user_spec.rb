require 'rails_helper'

describe User, type: :model do
  context 'when testing instance methods' do
    let(:user) { create(:user, email: 'accountant@example.com') }

    it 'returns the capitalized part of the email before "@" as name' do
      expect(user.name).to eq('Accountant')
    end

    it 'delegates company_name to the associated company' do
      expect(user.company_name).to eq(user.company.name)
    end
  end
end
