class Oracle
  def predict_the_future
		"You will " + choices.sample
  end

  def choices
		["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new  # => <Oracle: encoding of object ID>
p oracle.predict_the_future  # => "You will " + one of the strings from `choices`