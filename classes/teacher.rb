require_relative 'person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_pamission: true)
    super(age, name, parent_pamission: parent_pamission)
    @specialization = specialization
  end

  attr_accessor :specialization

  def can_use_services?
    true
  end
end
