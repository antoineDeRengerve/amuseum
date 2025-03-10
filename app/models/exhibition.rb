class Exhibition < ApplicationRecord
  has_many :exhibition_rooms
  has_many :rooms, through: :exhibition_rooms
end
