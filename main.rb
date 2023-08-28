require_relative 'classes/person'
require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/book'
require_relative 'classes/rental'
require_relative 'classes/classroom'
require_relative 'decorators/nameable'

# person = Person.new(22, 'maximilianus')
# person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name

ps = Person.new(22, 'Jane Doe')
bk1 = Book.new('Shatter Me', 'Tahereh Mafi')
bk2 = Book.new('The Last Black Unicorn', 'Tiffany Hadish')

Rental.new(bk1, ps, Time.now)
Rental.new(bk2, ps, Time.now)

puts "#{ps.name} has borrowed:"
ps.rentals.each { |book| p book.title }
