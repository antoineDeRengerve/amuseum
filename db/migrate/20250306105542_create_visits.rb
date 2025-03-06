class CreateVisits < ActiveRecord::Migration[8.0]
  def change
    create_table :visits do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.datetime :last_activity_at
      t.references :current_room, null: true, foreign_key: {to_table: :rooms}
      t.references :visitor, foreign_key: true

      t.timestamps
    end
  end
end
