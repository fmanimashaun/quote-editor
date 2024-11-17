require 'rails_helper'

describe 'Quotes', type: :system do
  let!(:user) { create(:user) } # Create a user for authentication
  let!(:quote) { create(:quote, company: user.company) } # Associate quote with the user's company

  before do
    # Simulate signing in as the user
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    # Verify redirection to the home page
    expect(page).to have_current_path(root_path)
  end

  context 'when managing quotes' do
    it 'creates a new quote' do
      visit quotes_path
      expect(page).to have_selector "h1", text: "Quotes"

      click_on "New quote"
      expect(page).to have_selector "h1", text: "Quotes"

      fill_in "Name", with: "Capybara quote"
      click_on "Create quote"

      expect(page).to have_selector "h1", text: "Quotes"
      expect(page).to have_text "Capybara quote"
    end

    it 'shows a quote' do
      visit quotes_path
      click_link quote.name

      expect(page).to have_selector "h1", text: quote.name
    end

    it 'updates a quote' do
      visit quotes_path
      expect(page).to have_selector "h1", text: "Quotes"

      click_on "Edit", match: :first
      expect(page).to have_selector "h1", text: "Quotes"

      fill_in "Name", with: "Updated quote"
      click_on "Update quote"

      expect(page).to have_selector "h1", text: "Quotes"
      expect(page).to have_text "Updated quote"
    end

    it 'destroys a quote' do
      visit quotes_path
      expect(page).to have_text quote.name

      click_on "Delete", match: :first
      expect(page).not_to have_text quote.name
    end
  end
end
