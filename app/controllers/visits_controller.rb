class VisitsController < ApplicationController
  allow_unauthenticated_access

  def create
    # Check visitor id from cookie and create a new visitor if needed
    ensure_visitor
    # Create visit
    current_visitor.create_visit!
    redirect_to current_visitor.current_room
  end
end
