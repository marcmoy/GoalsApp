class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false, index: true
      t.text :body, null: false
      t.boolean :completed, default: false
      t.string :privacy, null: false
      t.timestamps null: false
    end
  end
end
