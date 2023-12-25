contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
symbols = [:email, :address, :phone]

hash = contacts.each do |k, v|
  symbols.each do |sym|
    v[sym] = contact_data.shift
  end
end

p hash