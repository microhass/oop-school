require_relative 'classes/person'
require_relative 'classes/book'
require_relative 'classes/rental'

class App
  def initialize
    @people = []
    @books = []
  end

  def run
    puts 'Welcome to School library App!'
    show_options
  end

  def show_people; end

  def show_options
    puts "Please choose an option by entering a number:
      1 - List all books.
      2 - List all people.
      3 - Create a person.
      4 - Create a book.
      5 - Create a rental.
      6 - List all rentals for a given person id.
      7 - Exit."
  end

  def select_opt
    option = check_options('', (1..9))
    case option
    when 1 then list_books
    when 2 then list_people
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_rentals
    when 7
      write_json
      7
    else
      puts 'Invalid number, please try again!'
    end
  end
end
