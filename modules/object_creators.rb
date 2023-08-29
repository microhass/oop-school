module ObjectCreators
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
    notify_start_creation('student')
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
    notify_start_creation('teacher')
    age = fetch_age
    name = fetch_string('name')
    specialization = fetch_string('specialization')

    @people << Teacher.new(age, name, true, specialization)
    notify_created('teacher')
  end

  def create_book
    notify_start_creation('book')
    title = fetch_string('title')
    author = fetch_string('author')

    @books << Book.new(title, author)
    notify_created('book')
  end

  def create_rental
    notify_start_creation('rental')
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
end
