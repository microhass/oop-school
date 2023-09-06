require 'json'

module DataSavers
  def save_data
    people_hash = @people.each_with_index.map do |person, index|
      { class: person.class, age: person.age, name: person.name,
        specialization: (person.specialization if person.is_a?(Teacher)),
        parent_permission: person.parent_permission, index: index, id: person.id }
    end

    books_hash = @books.each_with_index.map do |book, index|
      { title: book.title, author: book.author, index: index }
    end

    rentals_hash = @rentals.each_with_index.map do |rental, _index|
      {
        person_index: @people.index(rental.person), book_index: @books.index(rental.book), date: rental.date
      }
    end

    create_file('person.json', people_hash)
    create_file('books.json', books_hash)
    create_file('rentals.json', rentals_hash)
  end

  private

  def create_file(file_name, data)
    json_data = JSON.generate(data)
    File.write("data/#{file_name}", json_data)
  end
end
