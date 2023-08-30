class Rental
  def initialize(book, person, date)
    @date = date
    @book = book
    @person = person

    # Add rentals to person & book rental list
    person.add_rental(book)
    book.add_rental(person)
  end

  attr_accessor :date
  attr_reader :person, :book
end
