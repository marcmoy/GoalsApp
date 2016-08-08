class Goal < ActiveRecord::Base
  PRIVACY_OPTIONS = %w(public private)
  validates :user_id, :body, :privacy, presence: true
  validates :privacy, inclusion: { in: PRIVACY_OPTIONS }
end
