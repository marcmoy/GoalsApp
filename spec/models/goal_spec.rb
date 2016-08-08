require 'rails_helper'

RSpec.describe Goal, type: :model do

  describe Goal do
    subject(:user) do
      FactoryGirl.build(:user,
        username: "jenn",
        password: "longenough")
      end

    subject(:goal) do
      FactoryGirl.build(:goal,
        user_id: 1,
        body: "drink more water",
        completed: false,
        privacy: "public")
      end

    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:body)}
    it {should validate_presence_of(:privacy)}
    it {should validate_inclusion_of(:privacy).in_array(%w(public private))}

    it "defaults a completed value to false " do
      expect(goal.completed).to be false
    end

  end
end
