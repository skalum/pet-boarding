class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.integer :pet_id
      t.integer :sitter_id

      t.datetime :start_date_and_time
      t.datetime :end_date_and_time

      t.timestamps
    end
  end
end
