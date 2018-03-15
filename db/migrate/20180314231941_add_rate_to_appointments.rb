class AddRateToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :rate, :decimal
  end
end
