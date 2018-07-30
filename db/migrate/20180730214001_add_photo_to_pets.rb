class AddPhotoToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :photo, :string
  end
end
