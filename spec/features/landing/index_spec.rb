# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page Index' do
  before(:each) do
    @user_1 = User.create!(name: 'Joe', email: 'joe@email.com')
    @user_2 = User.create!(name: 'Bob', email: 'bob@email.com')
    @user_3 = User.create!(name: 'Dan', email: 'dan@email.com')
    visit root_path
  end
  context 'As a user when I visit the landing page' do
    it 'I see a button to create a new user' do
      expect(page).to have_button('Create New User')
    end

    it "I see a list of existing users, that links to the user's dashboard" do
      within('#existing_users') do
        expect(page).to have_content('Joe')
        expect(page).to have_content('Bob')
        expect(page).to have_content('Joe')
      end
    end

    it 'I see a link to go back to the landing page' do
      within('#nav_bar') do
        expect(page).to have_link('Home')
        click_link('Home')
      end
      expect(current_path).to eq(root_path)
    end
  end
end
