class RoomsController < ApplicationController
  allow_unauthenticated_access only: :show

  def show
    @room = Room.find(params[:id])
  end
end
