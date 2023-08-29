module DataPresenters
  def display_books(show_index)
    return puts "You haven't created any books!\n" if @books.empty?

    @books.each_with_index do |book, index|
      num = "#{index + 1}) " if show_index
      puts "#{num}Title: '#{book.title}', Author: #{book.author}"
    end
  end

  def display_people(show_index)
    return puts "You haven't created any people!\n" if @people.empty?

    @people.each_with_index do |person, index|
      num = "#{index + 1}) " if show_index
      puts "#{num}[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def display_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i

    found_rentals = @rentals.filter { |rental| rental.person.id == person_id }

    return puts 'No rentals found for the person with that ID!' if found_rentals.empty?

    puts "\nRentals by #{found_rentals[0].person.name}"
    found_rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
