class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.string :address
      t.string :photo
      t.text :details
      t.string :size
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
