module Circa
  class Date
    def initialize(date_string)
      @year = "0000"
      @month = "00"
      @day = "00"
      @valid_parts = {}
      unless validate(date_string)
        raise ArgumentError, "Invalid date: #{date_string}"
      end
    end

    def to_s
      "#{@year}-#{@month}-#{@day}"
    end

    def valid_parts
      @valid_parts
    end

    def to_date
      year = @year.to_i
      return nil if year == 0
      month, day = [@month.to_i, @day.to_i].map do |num|
        if num > 0 then num else 1 end
      end
      ::Date.new(year, month, day)
    end

    private

    def validate(date_string)
      re = /^(\d{4})(?:-(0[0-9]|1[0-2])(?:-([0-2][0-9]|3[0-1])))$/
      matches = re.match(date_string)
      return false unless matches[0]
      set_year(matches) && set_month(matches) && set_day(matches)
    end

    def set_year(matches)
      @year = matches[1]
      if @year.to_i == 0
        return matches[2].to_i == 0
      else
        @valid_parts[:year] = @year
      end
    end

    def set_month(matches)
      @month = matches[2]
      if @month.to_i == 0
        return matches[3].to_i == 0
      else
        @valid_parts[:month] = @month
      end
    end

    def set_day(matches)
      @day = matches[3]
      if @day.to_i > 0
        return false unless ::Date.strptime(matches[0]).to_s == matches[0]
        @valid_parts[:day] = @day
      end
      true
    end
  end
end
