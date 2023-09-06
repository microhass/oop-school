module DataLoaders
  def load_people
    file_path = 'data/person.json'
    return [] unless File.exist?(file_path)

    file = File.open(file_path)
    persons_read = File.read(file)
    persons_json = JSON.parse(persons_read)
    people_data = []
    persons_json.each do |person|
      case person['class']
      when 'Teacher'
        people_data << Teacher.new(person['age'], person['name'], true, person['specialization'], id: person['id'])
      when 'Student'
        people_data << Student.new(person['age'], person['name'], parent_permission: person['parent_permission'], id: person['id'])
      end
    end
    file.close
    people_data
  end

  def load_books
    file_path = 'data/books.json'
    return [] unless File.exist?(file_path)

    file = File.open(file_path)
    books_read = File.read(file)
    books_json = JSON.parse(books_read)
    books_data = []

    books_json.each do |book|
      books_data << Book.new(book['title'], book['author'])
    end
    file.close
    books_data
  end

  def load_rentals
    file_path = 'data/rentals.json'
    return [] unless File.exist?(file_path)

    file = File.open(file_path)
    rentals_read = File.read(file)
    rentals_json = JSON.parse(rentals_read)
    rentals_data = []

    rentals_json.each do |rental|
      rentals_data << Rental.new(@books[rental['book_index']], @people[rental['person_index']], rental['date'])
    end
    file.close
    rentals_data
  end
end
