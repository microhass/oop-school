class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented the method '#{__method__}'"
  end
end

class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    curr_name = @nameable.correct_name
    return curr_name if curr_name.length <= 10

    curr_name.slice(0, 10)
  end
end
