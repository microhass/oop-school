require_relative 'person'

class Student < Person
  def initialize(age, name, parent_pamission, classroom)
    super(age, name, parent_pamission: parent_pamission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
