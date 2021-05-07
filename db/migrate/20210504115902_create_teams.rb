class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :team_name, null: false
      t.integer :number_of_people, null: false
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false

      t.timestamps
    end
  end
end
