module InputValidators
  def validate_input(input, max_val)
    loop do
      input_is_valid = input.is_a?(Integer) && input.between?(1, max_val)
      break if input_is_valid

      print 'Please enter a valid input: '
      input = gets.chomp.to_i
    end

    input
  end

  def fetch_valid_permission
    map_permission = { 'n' => false, 'y' => true }
    has_permission = nil

    loop do
      has_permission = map_permission[gets.chomp.downcase]
      break unless has_permission.nil?

      print 'Invalid permission! [Y/N]: '
    end

    has_permission
  end
end
