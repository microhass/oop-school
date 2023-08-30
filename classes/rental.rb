class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(book, person, date)
    @date = date
    @book = book
    @person = person

    # Add rentals to person & book rental list
    book.rentals << self
    person.rentals << self
  end
end
