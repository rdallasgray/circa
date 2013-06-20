module Circa
  class Date
    def initialize(date_string)
      if validate(date_string)
        @input_date_string = date_string
      else raise ArgumentError
      end
    end

    def to_s
      @input_date_string
    end

    private

    def validate date_string
      re = /^(\d{4})(?:-(0[0-9]|1[0-2])(?:-([0-2][0-9]|3[0-1])))$/
      matches = re.match(date_string)
      return false unless matches[0]

    end
  end
end
