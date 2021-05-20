class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :user_id, null: false
      t.integer :team_id
      t.integer :appointment_id
      t.integer :meeting_id
      t.integer :task_id
      t.timestamp :start_date, null: false
      t.timestamp :end_date
      t.time :time_span
      t.boolean :completed, null: false, default: false
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
