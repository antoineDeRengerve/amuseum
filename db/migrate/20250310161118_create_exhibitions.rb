class CreateExhibitions < ActiveRecord::Migration[8.0]
  def change
    create_table :exhibitions do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
