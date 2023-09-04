module DataFetchers
  def fetch_age
    print 'Age: '
    age = gets.chomp.to_i
    validate_input(age, 200)
  end

  def fetch_string(str)
    print "#{str.capitalize}: "
    gets.chomp
  end
end
