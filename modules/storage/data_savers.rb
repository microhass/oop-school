require 'json'

module DataSavers
  def save_data
    persons = @people.each_with_index.map do |person, index|
      { class: person.class, age: person.age, name: person.name,
        specialization: (person.specialization if person.instance_of?(Teacher)),
        parent_permission: person.parent_permission, index: index, id: person.id }
    end

    json_person = JSON.generate(persons)
    File.write('person.json', json_person)

    books = @books.each_with_index.map do |book, index|
      {
        title: book.title, author: book.author, index: index
      }
    end
    json_books = JSON.generate(books)
    File.write('books.json', json_books)

    rentals = @rentals.each_with_index.map do |rental, _index|
      {
        date: rental.date, book_index: @books.index(rental.book),
        person_index: @person.index(rental.person)
      }
    end

    json_rentals = JSON.generate(rentals)
    File.write('rentals.json', json_rentals)
  end
end
