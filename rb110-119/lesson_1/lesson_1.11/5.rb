flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |name, idx|
  if name.start_with?("Be")
    puts idx
  end
end