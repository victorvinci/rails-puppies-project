class RenameBookingsForeignKeys < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :pets_id
    remove_column :bookings, :users_id
    add_reference :bookings, :user, index: true, foreign_key: true
    add_reference :bookings, :pet, index: true, foreign_key: true
  end
end
