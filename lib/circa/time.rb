# encoding: UTF-8

require_relative 'date'
require_relative 'util'

module Circa
  class Time
    include Util
    REGEX = /^([0-1][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])Z?$/

    def initialize(time_string)
      parts = time_string.split(/T|\s/)
      @date = Date.new(parts[0])
      @hour = '00'
      @minute = '00'
      @second = '00'
      @valid_parts = {}
      unless validate(parts[1])
        raise ArgumentError, "Invalid time: #{time_string}"
      end
    end

    def to_s
      "#{@date.to_s} #{@hour}:#{@minute}:#{@second}"
    end

    def valid_parts
      time_parts = { hour: @hour, minute: @minute, second: @second }
      @date.valid_parts.merge(time_parts)
    end

    def to_time
      parts = [:year, :month, :day, :hour, :minute, :second]
      args = valid_parts_as_args(parts)
      ::DateTime.send(:new, *args)
    end

    private

    def validate(time_string)
      time_string.chomp!('Z')
      matches = REGEX.match(time_string)
      set_time(matches) if matches
    end

    def set_time(matches)
      @hour, @minute, @second = matches[1..3]
      [@hour, @minute, @second].join.to_i == 0 || @date.valid_parts[:day]
    end
  end
end
