require 'rails_helper'

feature 'User logs in' do
  scenario 'they see login button' do
    @user = FactoryGirl.create(:user)
    p @user

    visit root_path
    click_link 'Login'
    within("#loginModal") do
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_button 'Sign in'
    end
    
    expect(page).to have_content 'Create Post'
  end
end