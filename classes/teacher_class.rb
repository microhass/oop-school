require_relative 'person_class'

class Teacher < Person
  def initialize(age, name, parent_pamission, specialization)
    super(age, name, parent_pamission: parent_pamission)
    @specialization = specialization
  end

  attr_accessor :specialization

  def can_use_services?
    true
  end
end
