require_relative 'classes/person'
require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/book'
require_relative 'classes/rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def run
    puts "Welcome to School library App!\n"
  end

  def show_people; end

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

  def validate_input(input, max_val)
    loop do
      input_is_valid = input.is_a?(Integer) && input.between?(1, max_val)
      break if input_is_valid

      print 'Please enter a valid input: '

      input = gets.chomp.to_i
    end

    input
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

  def display_books(show_index)
    return puts "You haven't created any books!\n\n" if @books.empty?

    @books.each_with_index do |book, index|
      num = "#{index + 1}) " if show_index
      puts "#{num}Title: '#{book.title}', Author: '#{book.author}'"
    end
  end

  def display_people(show_index)
    return puts "You haven't created any people!\n\n" if @people.empty?

    @people.each_with_index do |person, index|
      num = "#{index + 1}) " if show_index
      puts "#{num}[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    puts 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]: '
    input = gets.chomp.to_i
    choice = validate_input(input, 2)

    case choice
    when 1 then create_student
    when 2 then create_teacher
    else puts 'Invalid choice, please try again!'
    end
  end

  def create_student
    puts 'Creating student...'
    age = fetch_age
    name = fetch_string('name')

    print 'Has parent permission? [Y/N]: '
    map_permission = { 'n' => false, 'y' => true }
    has_permission = nil

    loop do
      has_permission = map_permission[gets.chomp.downcase]
      break unless has_permission.nil?

      print 'Invalid permission! [Y/N]: '
    end

    @people << Student.new(age, name, has_permission)
    notify_created('student')
  end

  def create_teacher
    puts 'Creating teacher...'
    age = fetch_age
    name = fetch_string('name')
    specialization = fetch_string('specialization')

    @people << Teacher.new(age, name, true, specialization)
    notify_created('teacher')
  end

  def create_book
    title = fetch_string('title')
    author = fetch_string('author')

    @books << Book.new(title, author)
    notify_created('book')
  end

  def create_rental
    puts 'Select a book from the following list by number'
    display_books(true)
    book_index = validate_input(gets.chomp.to_i, @books.length)

    puts 'Select a person from the following list by number (not id)'
    display_people(true)
    person_index = validate_input(gets.chomp.to_i, @people.length)

    rent_date = fetch_string('date (yy/mm/dd)')
    @rentals << Rental.new(@books[book_index - 1], @people[person_index - 1], rent_date)
    notify_created('rental')
  end

  def display_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i

    found_rentals = @rentals.filter { |rental| rental.person.id == person_id }

    puts 'Rentals'
    found_rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
    end
  end

  def fetch_age
    print 'Age: '
    age = gets.chomp.to_i
    validate_input(age, 200)
  end

  def fetch_string(str)
    print "#{str.capitalize}: "
    gets.chomp
  end

  def notify_created(title)
    puts "#{title.capitalize} created successfuly!\n\n"
  end
end
# st = Student.new(age, name, permission)
