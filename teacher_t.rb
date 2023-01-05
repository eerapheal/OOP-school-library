require_relative 'person_p'

class Teacher < Person
  def initialize(specialization, age, name)
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
