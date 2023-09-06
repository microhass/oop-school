require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name, parent_pamission, specialization, id: Time.new.to_i)
    super(age, id, name, parent_pamission: parent_pamission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
