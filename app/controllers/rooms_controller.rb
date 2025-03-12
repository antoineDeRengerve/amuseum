class RoomsController < ApplicationController
  allow_unauthenticated_access only: :show

  def show
    @room = Room.find_by_id(params[:id])
    if @room.nil?
      redirect_to root_path
    end
  end
end
