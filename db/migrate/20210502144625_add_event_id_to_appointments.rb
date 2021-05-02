class AddEventIdToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :event_id, :integer
  end
end
