require 'circa/version'
require 'circa/date'
require 'circa/time'

module Circa
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
