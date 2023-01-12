require_relative 'person_p'

class Teacher < Person
  attr_accessor :specialization

  def initialize(name, age, specialization, id = Random.rand(1..1000))
    super(name, id, age, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => name,
      'age' => @age,
      'specialization' => @specialization
    }
  end
end
