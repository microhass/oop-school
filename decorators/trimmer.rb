require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    curr_name = @nameable.correct_name
    return curr_name if curr_name.length <= 10

    curr_name.slice(0, 10)
  end
end
