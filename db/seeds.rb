# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
Room.destroy_all

# Create rooms
entrance = Room.create!(
  name: "Museum Entrance",
  room_background_url: "entrance.jpg"
)

gallery1 = Room.create!(
  name: "Main Gallery",
  room_background_url: "gallery1.jpg"
)

gallery2 = Room.create!(
  name: "Modern Art Wing",
  room_background_url: "gallery2.jpg"
)

# Link rooms together
entrance.set_next_room(gallery1)
gallery1.set_next_room(gallery2)
