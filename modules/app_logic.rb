module AppLogic
  def show_options
    puts "\nPlease choose an option by entering a number:
      1 - List all books.
      2 - List all people.
      3 - Create a person.
      4 - Create a book.
      5 - Create a rental.
      6 - List all rentals for a given person id.
      7 - Exit.\n\n"
  end

  def call_activity_for(choice)
    case choice
    when 1 then display_books(false)
    when 2 then display_people(false)
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then display_rentals
    else puts 'Invalid choice, please try again!'
    end
  end
end
