class VisitsController < ApplicationController
  def create
    # Check visitor id and create a new visitor if needed
    visitor_uuid = cookies.signed[:visitor_uuid]
    if visitor_uuid.blank? || !Visitor.where(uuid: visitor_uuid).exists?
      # Create visitor
      visitor = Visitor.create
      # Create cookie. Expires after 1 week.
      cookies.signed[:visitor_uuid] = {
        value: visitor.uuid,
        expires: 1.week.from_now,
        httponly: true,
        secure: Rails.env.production?,
        same_site: :strict
      }
    end

    # Create visit
    Visit.create(visitor: visitor, room: Room.first_room)
    redirect_to room_path(Room.first_room)
  end
end
