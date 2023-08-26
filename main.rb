class Person
    def initialize(age, name="Unknown", parent_pamission=true)
        @name, @age = name, age
        @parent_pamission = parent_pamission
        @id = Time.new.to_f
    end

    attr_reader(:id)
    attr_accessor(:name, :age)

    # Make private
    def of_age?
        @age >= 18 || false
    end

    def can_use_services?
        (@parent_pamission && self.of_age?) || false
    end
end

class Student < Person
    # Constructor

    def play_hooky; '¯\\("◞∕∖‹)'; end

end

class Teacher < Person
    # Constructor

    def can_use_services?; true; end
end

person = Person.new(19)
p person.can_use_services?
