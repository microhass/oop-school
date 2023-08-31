require_relative '../decorators/nameable'

class Person < Nameable
  attr_accessor(:name, :age, :rentals, :parent_permission)
  attr_reader(:id)

  def initialize(age, name = 'Unknown', parent_pamission: true)
    super()
    @name = name
    @age = age
    @parent_pamission = parent_pamission
    @id = Time.new.to_i
    @rentals = []
  end

  def can_use_services?
    (@parent_pamission && of_age?) || false
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(book, self, date)
  end

  private

  def of_age?
    @age >= 18 || false
  end
end
