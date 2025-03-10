class CreateExhibitionRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :exhibition_rooms do |t|
      t.references :exhibition, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.integer :order, null: false
    end

    add_index :exhibition_rooms, [:exhibition_id, :room_id], unique: true
  end
end
