class AddGenderToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :gender, :string
  end
end
