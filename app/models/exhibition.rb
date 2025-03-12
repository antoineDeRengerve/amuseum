class Exhibition < ApplicationRecord
  DEFAULT_ROOMS_COUNT_MIN = 5
  DEFAULT_ROOMS_COUNT_MAX = 10
  has_many :exhibition_rooms, -> { order(:order) }
  has_many :rooms, through: :exhibition_rooms
  has_many :visits

  validates :start_date, :end_date, presence: true

  scope :ordered, -> { order(:end_date) }

  # Returns the current exhibition (today is between the exhibition dates) or creates a new one if none is found
  def self.current
    current_exhibition = Exhibition.where("start_date <= ? AND end_date >= ?", Date.today, Date.today).first
    current_exhibition.present? ? current_exhibition : Exhibition.add_next
  end

  # Creates a new exhibition after the last one or today's date if no exhibition is planned
  def self.add_next
    last_exhibition_date = Exhibition.ordered&.last&.end_date
    start_date = if last_exhibition_date.present? && last_exhibition_date > Date.today
      last_exhibition_date + 1.day
    else
      Date.today
    end
    end_date = start_date.sunday
    exhibition = Exhibition.create!(start_date: start_date, end_date: end_date)
    exhibition.assign_random_rooms
    exhibition
  end

  def assign_random_rooms
    rooms_count = rand(DEFAULT_ROOMS_COUNT_MIN..DEFAULT_ROOMS_COUNT_MAX)
    rooms.clear
    rooms_list = Room.all.sample(rooms_count)
    rooms_list.each_with_index do |room, index|
      ExhibitionRoom.create!(exhibition: self, room: room, order: index)
    end
  end
end
