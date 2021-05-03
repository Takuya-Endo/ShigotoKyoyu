class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :event_id, null: false
      t.string :destination, null: false
      t.string :person_in_charge, null: false
      t.string :contact_means, null: false
      t.string :nearest_station
      t.time :travel_time
      t.time :preparation_time
      t.timestamp :created_at, null: false
      t.timestamp :updated_at, null: false

      t.timestamps
    end
  end
end
