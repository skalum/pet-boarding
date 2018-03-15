class RemoveAgeFromPets < ActiveRecord::Migration[5.1]
  def change
    remove_column :pets, :age
  end
end
