class AddExhibitionToVisits < ActiveRecord::Migration[8.0]
  def up
    add_reference :visits, :exhibition, null: true, foreign_key: true

    Exhibition.reset_column_information
    Visit.find_each do |visit|
      # Set the current exhibition as the exhibition for the existing visits
      exhibition = Exhibition.current
      visit.update_column(:exhibition_id, exhibition.id)
      visit.update_column(:current_room_id, exhibition.rooms.first.id)
    end

    change_column_null :visits, :exhibition_id, false
  end

  def down
    remove_reference :visits, :exhibition
    Visit.update_all(current_room_id: nil) # Note: user will need to restart the visit from the first room
  end
end
