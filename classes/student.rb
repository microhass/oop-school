require_relative 'person'

class Student < Person
  def initialize(age, name = 'Unknown', parent_pamission: true)
    super(age, name, parent_pamission: parent_pamission)
    @classroom = nil
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
