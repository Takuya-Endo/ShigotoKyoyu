class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :destination, null: false
      t.string :person_in_charge, null: false
      t.string :nearest_station, null: false
      t.time :preparation_time, null: false
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false

      t.timestamps
    end
  end
end
