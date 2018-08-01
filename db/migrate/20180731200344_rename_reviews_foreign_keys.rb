class RenameReviewsForeignKeys < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :bookings_id
    add_reference :reviews, :booking, index: true, foreign_key: true
  end
end
