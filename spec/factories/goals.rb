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

FactoryGirl.define do
  factory :goal do
    
  end
end
