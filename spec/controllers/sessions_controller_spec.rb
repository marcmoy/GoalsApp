require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

    describe "POST #new" do
      it "renders a login page" do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe "POST #create" do
      before(:each) do
        User.create!(username: "marc", password: "password")
      end

      context "with invalid user params" do
        it "renders the new page with flash errors" do
          post :create, user: { username: "marc", password: "bad_password"}
          expect(response).to render_template("new")
          expect(flash[:errors]).to be_present
        end
      end

      context "with valid user params" do
        it "redirects to goals index page with flash notice" do
          post :create, user: { username: "marc", password: "password" }
          expect(flash[:notice]).to be_present
          expect(response).to redirect_to("/goals")
        end
      end
    end

end
