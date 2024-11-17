require 'rails_helper'

describe Quote, type: :model do
  context "With a valid factory" do
    let!(:quote) { build(:quote) }

    it "has a valid factory" do
      expect(quote).to be_a(Quote)
      expect(quote).to be_valid
    end
  end

  context "Validations" do
    let!(:quote) { create(:quote) }

    it "has a valid name attribute" do
      expect(quote.name).to be_present
      expect(quote.name).to be_a(String)
    end

    it "is invalid without a name" do
      quote.name = nil
      expect(quote).not_to be_valid
      expect(quote.errors[:name]).to include("can't be blank")
    end
  end
end
