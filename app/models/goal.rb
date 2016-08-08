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

class Goal < ActiveRecord::Base

  validates :author, :title, :body, presence: true
  validates_inclusion_of :private, in: [true, false]
  validates_inclusion_of :completed, in: [true, false]

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  def status
    completed ? 'Completed' : 'Ongoing'
  end

end
