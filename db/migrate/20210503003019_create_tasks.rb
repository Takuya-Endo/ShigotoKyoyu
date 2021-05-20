class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :event_id, null: false
      t.integer :deadline_status, null: false
      t.string :title, null: false
      t.text :introduction
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false

      t.timestamps
    end
  end
end
