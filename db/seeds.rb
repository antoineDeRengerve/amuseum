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
hall1 = Room.create!(
  name: "Salle des Antiquités",
  room_background_url: "hall1.webp",
  is_first_room: true
)

hall2 = Room.create!(
  name: "Galerie d'Art Classique",
  room_background_url: "hall2.webp"
)

hall3 = Room.create!(
  name: "Salle d'Art Moderne et Contemporain",
  room_background_url: "hall3.webp"
)

hall4 = Room.create!(
  name: "Salle des Sciences et de la Nature",
  room_background_url: "hall4.webp"
)

hall5 = Room.create!(
  name: "Salle d’Histoire et de Civilisations",
  room_background_url: "hall5.webp"
)

hall6 = Room.create!(
  name: "Salle des Inventions et Technologies",
  room_background_url: "hall6.webp"
)

hall7 = Room.create!(
  name: "Galerie de la Photographie",
  room_background_url: "hall7.webp"
)

hall8 = Room.create!(
  name: "Salle des Arts Décoratifs",
  room_background_url: "hall8.webp"
)

hall9 = Room.create!(
  name: "Espace Immersif et Numérique",
  room_background_url: "hall9.webp"
)

hall10 = Room.create!(
  name: "Salle des Expositions Temporaires",
  room_background_url: "hall10.webp"
)

hall11 = Room.create!(
  name: "La Salle des Faux Grands Maîtres",
  room_background_url: "hall11.webp"
)

hall12 = Room.create!(
  name: "La Galerie de l'Art Invisible",
  room_background_url: "hall12.webp"
)

hall13 = Room.create!(
  name: "Le Hall des Sculptures Flottantes",
  room_background_url: "hall13.webp"
)

hall14 = Room.create!(
  name: "Le Salon des Mèmes Sacrés",
  room_background_url: "hall14.webp"
)

hall15 = Room.create!(
  name: "La Salle du Minimalisme Absolu",
  room_background_url: "hall15.webp"
)

hall16 = Room.create!(
  name: "Le Département des Couleurs Oubliées",
  room_background_url: "hall16.webp"
)

hall17 = Room.create!(
  name: "L’Atelier du Faux Restauration",
  room_background_url: "hall17.webp"
)

hall18 = Room.create!(
  name: "Le Corridor des Objets Inutiles",
  room_background_url: "hall18.webp"
)

hall19 = Room.create!(
  name: "La Salle des Perspectives Trompeuses",
  room_background_url: "hall19.webp"
)

hall20 = Room.create!(
  name: "La Galerie de l'Art Qui Regarde",
  room_background_url: "hall20.webp"
)

# Link rooms together
hall1.set_next_room(hall2)
hall2.set_next_room(hall3)
hall3.set_next_room(hall4)
hall4.set_next_room(hall5)
hall5.set_next_room(hall6)
hall6.set_next_room(hall7)
hall7.set_next_room(hall8)
hall8.set_next_room(hall9)
hall9.set_next_room(hall10)
hall10.set_next_room(hall11)
hall11.set_next_room(hall12)
hall12.set_next_room(hall13)
hall13.set_next_room(hall14)
hall14.set_next_room(hall15)
hall15.set_next_room(hall16)
hall16.set_next_room(hall17)
hall17.set_next_room(hall18)
hall18.set_next_room(hall19)
hall19.set_next_room(hall20)
