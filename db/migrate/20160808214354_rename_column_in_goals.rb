class RenameColumnInGoals < ActiveRecord::Migration
  def change
    rename_column :goals, :user_id, :author_id
  end
end
