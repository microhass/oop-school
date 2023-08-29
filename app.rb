require_relative 'classes/person'
require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/book'
require_relative 'classes/rental'

class App
  def initialize
    @people = []
    @books = []
  end

  def run
    puts "Welcome to School library App!\n\n"
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
    when 1 then display_books
    # when 2 then list_people
    when 3 then create_person
    # when 4 then create_book
    # when 5 then create_rental
    # when 6 then list_rentals
    else puts 'Invalid choice, please try again!'
    end
  end

  def display_books; end

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
    name = fetch_name

    print 'Has parent permission? [Y/N]: '
    map_permission = { 'n' => false, 'y' => true }
    has_permission = nil

    loop do
      has_permission = gets.chomp.downcase
      break unless map_permission[has_permission].nil?

      print 'Invalid permission! [Y/N]: '
    end

    Student.new(age, name, has_permission)
    notify_created('student')
  end

  def create_teacher
    puts 'Creating teacher...'
    age = fetch_age
    name = fetch_name

    print 'Specialization: '
    specialization = gets.chomp

    Teacher.new(age, name, true, specialization)
    notify_created('teacher')
  end

  def fetch_age
    print 'Age: '
    age = gets.chomp.to_i
    validate_input(age, 200)
  end

  def fetch_name
    print 'Name: '
    gets.chomp
  end

  def notify_created(title)
    puts "#{title.capitalize} created successfuly!\n\n"
  end
end
# st = Student.new(age, name, permission)
