module DataLoaders
  def load_people
    file_path = 'data/person.json'
    return [] unless File.exist?(file_path)

    file = File.open(file_path)
    persons_json = JSON.parse(File.read(file))
    people_data = []
    persons_json.each do |person|
      age = person['age']
      name = person['name']
      id = person['id']

      case person['class']
      when 'Teacher'
        spec = person['specialization']
        people_data << Teacher.new(age, name, true, spec, id: id)
      when 'Student'
        pp = person['parent_permission']
        people_data << Student.new(age, name, parent_permission: pp, id: id)
      end
    end
    file.close
    people_data
  end

  def load_books
    file_path = 'data/books.json'
    return [] unless File.exist?(file_path)

    file = File.open(file_path)
    books_json = JSON.parse(File.read(file))
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
    rentals_json = JSON.parse(File.read(file))
    rentals_data = []

    rentals_json.each do |rental|
      book = @books[rental['book_index']]
      person = @people[rental['person_index']]
      date = rental['date']

      rentals_data << Rental.new(book, person, date)
    end
    file.close
    rentals_data
  end
end
