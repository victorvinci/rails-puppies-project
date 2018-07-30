class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :pet_rating
      t.text :pet_content
      t.integer :user_rating
      t.text :user_content
      t.references :bookings, foreign_key: true

      t.timestamps
    end
  end
end
