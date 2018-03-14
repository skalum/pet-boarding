class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.date :dob
      t.integer :age
      t.text :feeding_regimen
      t.text :medication_regimen
      t.text :other_notes

      t.integer :owner_id
    end
  end
end
