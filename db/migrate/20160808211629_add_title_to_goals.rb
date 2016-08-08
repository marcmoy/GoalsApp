class AddTitleToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :title, :string
  end
end
