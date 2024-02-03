munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_value do |value|
  case value["age"]
  when 0...18
    value["age_group"] = "kid"
  when 18...65
    value["age_group"] = "adult"
  else
    value["age_group"] = "senior"
  end
end

p munsters