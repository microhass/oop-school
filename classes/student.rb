require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_pamission)
    super(age, name, parent_pamission: parent_pamission)
    @classroom = nil
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
