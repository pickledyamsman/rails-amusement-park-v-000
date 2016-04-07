class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if not_enough_tickets || not_tall_enough
      if not_enough_tickets && not_tall_enough
        return "Sorry. #{not_enough_tickets} #{not_tall_enough}"
      elsif not_enough_tickets
        return "Sorry. #{not_enough_tickets}"
      else
        return "Sorry. #{not_tall_enough}"
      end
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
    end
  end

  def not_enough_tickets
    if user.tickets < attraction.tickets
      "You do not have enough tickets the #{attraction.name}."
    end
  end

  def not_tall_enough
    if user.height < attraction.min_height
      "You are not tall enough to ride the #{attraction.name}."
    end
  end
end
