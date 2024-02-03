munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


res = munsters.select do |person, description|
  if description["gender"] == "male"
    description["age"]
  end
end

total_age = 0
res.each do |person, description|
  total_age += description["age"]
end

p total_age