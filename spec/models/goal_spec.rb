# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  author_id  :integer          not null
#  body       :text             not null
#  completed  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#  private    :boolean          not null
#

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
        author_id: 1,
        body: "drink more water",
        completed: false,
        private: false)
      end

    it {should validate_presence_of(:author)}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:body)}
    it {should validate_inclusion_of(:private).in_array([true, false])}

    it "defaults a completed value to false " do
      expect(goal.completed).to be false
    end

  end
end
