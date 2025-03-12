class VisitsController < ApplicationController
  allow_unauthenticated_access

  def create
    # Create visit
    current_visitor.create_visit!
    redirect_to current_visitor.current_room
  end
end
