require 'spec_helper'
require 'rails_helper'

feature "goals index page" do
  before(:each) do
    FactoryGirl.create(:user, id: 1, username: "private_user", password: "password")
    FactoryGirl.create(:user, id: 2, username: "public_user", password: "password")

    #private goals
    FactoryGirl.create(:goal, author_id: 1, title: "Water", body: "drink more water", completed: true, private: true)
    FactoryGirl.create(:goal, author_id: 1, title: "Sleeping", body: "sleeping more", completed: false, private: true)
    #public goals
    FactoryGirl.create(:goal, author_id: 2, title: "Eating", body: "eat better", completed: true, private: false)
    FactoryGirl.create(:goal, author_id: 2, title: "Exercise", body: "exercising more", completed: false, private: false)
  end

  feature "when a user isn't logged in" do
    before(:each){ visit goals_url }

    scenario "able to see links for log in or sign up" do
      expect(page).to have_content "Log in"
      expect(page).to have_content "Sign up"
    end

    scenario "cannot see private goals" do
      expect(page).to_not have_content "Water"
      expect(page).to_not have_content "Sleeping"
    end

    scenario "can see completed or ongoing goals" do
      expect(page).to have_content "Completed"
      expect(page).to have_content "Ongoing"
    end

    scenario "can click and view a public goal" do
      click_on 'Eating'
    end
  end

  feature "when a user is logged in" do
    before(:each) do
      visit new_session_url
      fill_in 'username', with: "private_user"
      fill_in 'password', with: "password"
      click_on "Login user"
    end

    scenario "see a button to logout" do
      expect(page).to have_button "Logout"
    end

    scenario "can see public goals with title and author username" do
      expect(page).to have_content "Eating"
      expect(page).to have_content "by public_user"
    end
  end

end
