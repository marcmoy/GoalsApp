require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's username and password" do
        post :create, user: {name: "marc", password: ""}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

      it "validates that the password is at least 6 characters long" do
        post :create, user: {name: "marc", password: "short"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

      context "with valid params" do
        it "redirects user to goals index on success" do
          post :create, user: {name: "marc", password: "valid_password"}
          expect(response).to redirect_to(goals_url)
        end
      end

    end
  end
end
