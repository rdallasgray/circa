require 'minitest/spec'
require_relative '../lib/circa/date'

describe Circa::Date do

  it "should reject a date with a zero year and non-zero month" do
    lambda { Circa::Date.new("0000-11-00") }.must_raise ArgumentError
  end

  it "should reject a date with a zero month and non-zero day" do
    lambda { Circa::Date.new("2001-00-11") }.must_raise ArgumentError
  end

  it "should return a correct date string intact" do
    Circa::Date.new("2001-11-11").to_s.must_equal "2001-11-11"
  end

  it "should return a correct partial date string" do
    Circa::Date.new("2001-11-00").to_s.must_equal "2001-11-00"
  end
end
