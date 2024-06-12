def generate_uuid
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |letter| characters << letter }

  sections = [8, 4, 4, 4, 12]
  uuid = ""
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end
  uuid
end

p generate_uuid