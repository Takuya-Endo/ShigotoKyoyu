class AddParticipantToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :participant, :integer
  end
end
