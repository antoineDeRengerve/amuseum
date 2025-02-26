class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :room_background_url
      t.belongs_to :prev_room, null: true, foreign_key: {to_table: :rooms}
      t.belongs_to :next_room, null: true, foreign_key: {to_table: :rooms}

      t.timestamps
    end
  end
end
