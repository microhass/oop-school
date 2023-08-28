class Nameable
    def correct_name
        raise NotImplementedError, "#{self.class} has not implemented the method '#{__method__}'"
    end
end

n = Nameable.new
n.correct_name