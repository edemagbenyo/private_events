require 'rails_helper'

RSpec.describe 'Sign in', type: :feature do
  scenario 'user is gonna signin' do
    visit root_path
    fill_in "user[name]", with: "user1"
    fill_in "user[email]", with: "user1@email.com"
    click_button('button')
    expect(page).to have_content("Welcome to our private events platform")
  end
end
