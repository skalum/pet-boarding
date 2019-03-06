class AddRateToSitters < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rate, :decimal, default: 0.00
  end
end
