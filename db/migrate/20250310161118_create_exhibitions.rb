class CreateExhibitions < ActiveRecord::Migration[8.0]
  def change
    create_table :exhibitions do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
  end
end
