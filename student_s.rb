require_relative 'person_p'

class Student < Person
  attr_reader :classroom
  def initialize(age, name, parent_permission)
    super(name, age, parent_permission:  parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
