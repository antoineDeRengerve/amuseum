class CreateVisitors < ActiveRecord::Migration[8.0]
  def change
    create_table :visitors, id: false do |t|
      t.string :id, primary_key: true, null: false
      t.timestamps
    end
  end
end
