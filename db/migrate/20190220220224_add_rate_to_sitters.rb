class AddRateToSitters < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rate, :decimal
  end
end
