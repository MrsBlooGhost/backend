class Oracle
  def predict_the_future
		"You will " + choices.sample
  end

  def choices
		["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
		["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new  # => <RoadTrip: encoding of object ID>, saved in variable `trip`
p trip.predict_the_future  # => "You will " + <something>, where `something` is
# one of the strings in `choices` defined in `RoadTrip`.