class Person
  def initialize(age, name = 'Unknown', parent_pamission: true)
    @name = name
    @age = age
    @parent_pamission = parent_pamission
    @id = Time.new.to_f
  end

  attr_reader(:id)
  attr_accessor(:name, :age)

  def can_use_services?
    (@parent_pamission && of_age?) || false
  end

  private

  def of_age?
    @age >= 18 || false
  end
end
