class RemoveRateFromAppointments < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :rate
  end
end
