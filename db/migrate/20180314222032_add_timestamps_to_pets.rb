class AddTimestampsToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :created_at, :datetime
    add_column :pets, :updated_at, :datetime
  end
end
