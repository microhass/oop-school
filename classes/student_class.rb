require_relative 'person_class'

class Student < Person
  def initialize(age, name, parent_pamission, classroom)
    super(age, name, parent_pamission: parent_pamission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
