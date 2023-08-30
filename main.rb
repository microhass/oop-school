# Classes
require_relative 'classes/person'
require_relative 'classes/student'
require_relative 'classes/teacher'

# Decorators
require_relative 'decorators/capitalize'
require_relative 'decorators/nameable'
require_relative 'decorators/trimmer'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
