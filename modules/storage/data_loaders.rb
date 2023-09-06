module DataLoaders
  def load_persons
    load_from_json('persons.json') do |person_data|
      case person_data['class']
      when 'Teacher'
        Teacher.new(person_data['age'], person_data['specialization'], person_data['name'], id: person_data['id'])
      when 'Student'
        Student.new(person_data['age'], person_data['name'], parent_permission: person_data['parent_permission'],
                                                             id: person_data['id'])
      end
    end
  end

  def load_books
    load_from_json('books.json') do |book_data|
      Book.new(book_data['title'], book_data['author'])
    end
  end

  def load_rentals
    load_from_json('rentals.json') do |rental_data|
      Rental.new(rental_data['date'], @persons[rental_data['person_index']], @books[rental_data['book_index']])
    end
  end
end
