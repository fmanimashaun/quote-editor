require 'rails_helper'

describe 'Quotes', type: :system do
  let!(:quote) { create(:quote) }

  context 'when managing quotes' do
    it 'creates a new quote' do
      visit quotes_path
      expect(page).to have_selector "h1", text: "Quotes"

      click_on "New quote"
      expect(page).to have_selector "h1", text: "New quote"

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
      expect(page).to have_selector "h1", text: "Edit quote"

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
