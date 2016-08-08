# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe User do
    subject(:user) do
      FactoryGirl.build(:user,
        username: "jenn",
        password: "longenough")
      end

    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}
    it {should validate_length_of(:password).is_at_least(6)}

    it "creates a password digest when a password is given" do
      expect(user.password_digest).to_not be_nil
    end

    it "creates a session token before validation" do
      user.valid?
      expect(user.session_token).to_not be_nil
    end

    describe "#reset_session_token!" do
      it "sets a new session token on the user" do
        user.valid?
        old_session_token = user.session_token
        user.reset_session_token!

        expect(user.session_token).to_not eq(old_session_token)
      end

      it "returns the new session token" do
        expect(user.reset_session_token!).to eq(user.session_token)
      end
    end

    describe "#is_password?" do
      it "verifies if a password is correct" do
        expect(user.is_password?("longenough")).to be true
      end

      it "verifies if a password is NOT correct" do
        expect(user.is_password?("short")).to be false
      end
    end

    describe ".find_by_credentials" do
      before { user.save! }

      it "returns user given good credentials" do
        expect(User.find_by_credentials("jenn", "longenough")).to eq(user)
      end

      it "returns user given bad credentials" do
        expect(User.find_by_credentials("jenn", "short")).to eq(nil)
      end
    end
  end
end
