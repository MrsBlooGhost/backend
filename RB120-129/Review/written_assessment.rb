=begin

Code Spikes

### Design a Sports Team (Author Unknown)

- Include 4 players (attacker, midfielder, defender, goalkeeper)
- All the players’ jersey is blue, except the goalkeeper, his jersey is white with blue stripes
- All players can run and shoot the ball.
- Attacker should be able to lob the ball
- Midfielder should be able to pass the ball
- Defender should be able to block the ball
- The referee has a whistle. He wears black and is able to run and whistle.
=end


### Preschool (by Natalie Thompson)

## Description

# Inside a preschool there are children, teachers, class assistants, a principal, janitors, and cafeteria workers. Both teachers and assistants can help a student with schoolwork and watch them on the playground. A teacher teaches and an assistant helps kids with any bathroom emergencies. Kids themselves can learn and play. A teacher and principal can supervise a class. Only the principle has the ability to expel a kid. Janitors have the ability to clean. Cafeteria workers have the ability to serve food. Children, teachers, class assistants, principals, janitors and cafeteria workers all have the ability to eat lunch.

# + Inside a preschool
# + there are children, teachers, class assistants, a principal, janitors, and cafeteria workers.

# + Both teachers and assistants can help a student with schoolwork
# + and watch them on the playground.

# + A teacher teaches

# + and an assistant helps kids with any bathroom emergencies.

# + Kids themselves can learn
# + and play.

# + A teacher and principal can supervise a class.

# + Only the principle has the ability to expel a kid.

# + Janitors have the ability to clean.

# + Cafeteria workers have the ability to serve food.

# + Children, teachers, class assistants, principles, janitors and cafeteria workers all have the ability to eat lunch.

module Watchable
  def watch_students
    "I watch students on the playground."
  end
end

module Helpable
  def help_with_schoolwork; end
end

module Supervisable
  def supervise; end
end

class Preschool
  def initialize
    @staff = Staff.new
    @students = Students.new
  end

  def eat_lunch
    "I eat lunch."
  end
end

class Staff < Preschool
end

class Teacher < Staff
  include Watchable
  include Helpable
  include Supervisable

  def teach; end
end

class ClassAssistant < Staff
  include Watchable
  include Helpable

  def help_with_bathroom
    "If there's a bathroom emergency, I help the students."
  end
end

class Principal < Staff
  include Supervisable

  def expel_student; end
end

class Janitor < Staff
  def clean; end
end

class CafeteriaWorker < Staff
  def serve_food; end
end

class Students < Preschool
  def learn; end
  def play; end
end


### Dental Office Alumni (by Rona Hsu)

## Description

# There's a dental office called Dental People Inc. within which there are 2 oral surgeons, 2 orthodontists, 1 general dentist. Both general dentists and oral surgeons can pull teeth. Orthodontists cannot pull teeth. Orthodontists straighten teeth. Oral surgeons place implants. General dentists fill teeth. All of these aforementioned specialties are dentists. All dentists graduated from dental school.


# + There's a dental office
# + called Dental People Inc.

# + within which there are 2 oral surgeons, 2 orthodontists, 1 general dentist.
# + All of these aforementioned specialties are dentists.
# + All dentists graduated from dental school.

# + Both general dentists can pull teeth
# + and oral surgeons can pull teeth.

# + General dentists fill teeth.

# + Oral surgeons place implants.

# + Orthodontists cannot pull teeth.
# + Orthodontists straighten teeth.

=begin

module Pullable
  def pull_teeth
    "I pull teeth."
  end
end

class DentalOffice
  def initialize
    @name = "Dental People Inc."
    @oral_surgeon_count = 2
    @orthodontist_count = 2
    @general_dentist_count = 1
  end
end

class Dentist
  def initialize
    @graduated_dental_school = true
  end
end

class OralSurgeon < Dentist
  include Pullable

  def place_implants
    "I place implants."
  end
end

class Orthodontist < Dentist
  def straighten_teeth
    "I straighten teeth."
  end
end

class GeneralDentist < Dentist
  include Pullable

  def fill_teeth
    "I fill teeth."
  end
end

=end