# encoding: UTF-8

require 'circa/version'
require 'circa/date'
require 'circa/time'

module Circa
  # Convenience method to create a new {Circa::Date} or {Circa::Time}
  # @param [String] input_string
  #   A string in format %Y-%m-%d or %Y-%m-%d %H:%M:%S
  # @return [Circa::Date/Circa::Time]
  #   A new {Circa::Date} or {Circa::Time} depending on input
  # @raise [ArgumentError]
  #   If an invalid input string is given
  def circa(input_string)
    if match_date(input_string)
      Date.new(input_string)
    elsif match_time(input_string)
      Time.new(input_string)
    else
      raise ArgumentError, "Invalid input string: #{input_string}"
    end
  end

  private

  def match_date(input_string)
    input_string =~ Date::REGEX
  end

  def match_time(input_string)
    date_re = Date::REGEX.source.sub(/\$$/, '')
    time_re = Time::REGEX.source.sub(/^\^/, '')
    input_string =~ Regexp.new("#{date_re}T|\s#{time_re}")
  end
end
