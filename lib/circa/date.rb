# encoding: UTF-8

module Circa
  class Date
    attr_reader :valid_parts

    def initialize(date_string)
      @year = '0000'
      @month = '00'
      @day = '00'
      @valid_parts = {}
      unless validate(date_string)
        raise ArgumentError, "Invalid date: #{date_string}"
      end
    end

    def to_s
      "#{@year}-#{@month}-#{@day}"
    end

    def to_date
      return nil if (year = @year.to_i) == 0
      month, day = [@month, @day].map do |part|
        part = part.to_i
        part > 0 ? part : 1
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
      set_dependent(@year, matches[2], :year)
    end

    def set_month(matches)
      @month = matches[2]
      set_dependent(@month, matches[3], :month)
    end

    def set_dependent(a, b, name)
      a.to_i > 0 ? @valid_parts[name] = a : b.to_i == 0
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
