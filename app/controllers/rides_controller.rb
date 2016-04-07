class RidesController < ApplicationController
  def create
    @ride = Ride.new(ride_params)
    @attraction = Attraction.find(params[:ride][:attraction_id])
    @ride.take_ride
  
  if !(@ride.not_enough_tickets || @ride.not_tall_enough)
    flash[:notice] = "Thanks for riding the #{@attraction.name}!"
  end

  if @ride.not_tall_enough
    flash[:alert] = "You are not tall enough to ride the #{@attraction.name}"
  end

  if @ride.not_enough_tickets
    flash[:error] = "You do not have enough tickets the #{@attraction.name}"
  end

  redirect_to user_path(User.find(@ride.user_id))
end

def ride_params
  params.require(:ride).permit(:user_id, :attraction_id)
end


end
