class AddParticipantToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :participant, :integer
  end
end
