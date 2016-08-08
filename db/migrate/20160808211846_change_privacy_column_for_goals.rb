class ChangePrivacyColumnForGoals < ActiveRecord::Migration
  def change
    remove_column :goals, :privacy
    add_column :goals, :private, :boolean, null: false
  end
end
