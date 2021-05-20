class CreateTeamMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :team_members do |t|
      t.integer :user_id, null: false
      t.integer :team_id, null: false
      t.integer :privilege, null: false
      t.integer :join_status, null: false
      t.timestamp :created_at, null: false
      t.integer :updated_at, null: false

      t.timestamps
    end
  end
end
