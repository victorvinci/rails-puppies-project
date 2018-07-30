class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :booking_start
      t.datetime :booking_end
      t.string :status
      t.references :pets, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
