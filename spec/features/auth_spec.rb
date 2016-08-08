# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New user"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: "some_user"
      fill_in 'password', with: "fake_password"
      click_on "Create user"
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "some_user"
    end

    scenario "shows redirect to Goals index page after signup" do
      expect(page).to have_content "Goals index"
    end
  end

end

feature "session" do

  before(:each) do

    FactoryGirl.create(:user,
      username: "some_user",
      password: "fake_password")

    visit new_session_url
    fill_in 'username', with: "some_user"
    fill_in 'password', with: "fake_password"
    click_on "Login user"
  end

  feature "logging in" do


    scenario "shows username on the homepage after login" do
      expect(page).to have_content "some_user"
    end

    scenario "shows redirect to Goals after login" do
      expect(page).to have_content "Goals index"
    end

  end

  feature "logging out" do
    before(:each) do
      click_on 'Logout'
    end

    scenario "begins with a logged out state" do
      expect(page).to_not have_content "Logout"
    end

    scenario "doesn't show username on the homepage after logout" do
      expect(page).to_not have_content "some_user"
    end
  end

end
