# encoding: UTF-8

require_relative 'util'

module Circa
  # Manage partial dates.
  # @!attribute [r] valid_parts
  #   @return [Hash]
  #     A hash of valid parts in the date,
  #     with keys [:year, :month, :day] where applicable,
  #     and according values
  class Date
    include Util

    # Match partial dates in format %Y-%m-%d
    REGEX = /^(\d{4})(?:-(0[0-9]|1[0-2])(?:-([0-2][0-9]|3[0-1])))$/

    attr_reader :valid_parts

    # Create a new {Circa::Date}
    # @param [String] date_string
    #   A string in format %Y-%m-%d
    # @raise [ArgumentError]
    #  If an invalid string is given
    def initialize(date_string)
      @year = '0000'
      @month = '00'
      @day = '00'
      @valid_parts = {}
      unless validate(date_string)
        raise ArgumentError, "Invalid date: #{date_string}"
      end
    end

    # Get the date as a string
    # @return [String]
    #   A string in format %Y-%m-%d
    def to_s
      "#{@year}-#{@month}-#{@day}"
    end

    # Get the date as a {::Date}
    # @return [::Date]
    #   A {::Date}
    def to_date
      return nil if valid_parts.empty?
      parts = [:year, :month, :day]
      args = valid_parts_as_args(parts)
      ::Date.send(:new, *args)
    end

    private

    def validate(date_string)
      matches = REGEX.match(date_string)
      return false if matches.nil?
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
