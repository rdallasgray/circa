module Circa
  class Date
    def initialize(date_string)
      @year = "0000"
      @month = "00"
      @day = "00"
      raise ArgumentError unless validate(date_string)
    end

    def to_s
      "#{@year}-#{@month}-#{@day}"
    end

    private

    def validate(date_string)
      re = /^(\d{4})(?:-(0[0-9]|1[0-2])(?:-([0-2][0-9]|3[0-1])))$/
      matches = re.match(date_string)
      return false unless matches[0]
      @year = matches[1]
      if @year.to_i == 0
        return false if matches[2].to_i > 0
      end
      @month = matches[2]
      if @month.to_i == 0
        return false if matches[3].to_i > 0
      end
      @day = matches[3]
      if @day.to_i > 0
        return ::Date.strptime(date_string).to_s == date_string
      end
      true
    end
  end
end
