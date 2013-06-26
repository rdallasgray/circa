require 'minitest/spec'
require_relative '../lib/circa/date'

describe Circa::Date do

  it "should reject a date with a zero year and non-zero month" do
    lambda { Circa::Date.new("0000-11-00") }.must_raise ArgumentError
  end

  it "should reject a date with a zero month and non-zero day" do
    lambda { Circa::Date.new("2001-00-11") }.must_raise ArgumentError
  end

  it "should reject an incorrect date" do
    lambda { Circa::Date.new("2001-02-30") }.must_raise ArgumentError
  end

  it "should return a correct date string intact" do
    Circa::Date.new("2001-11-11").to_s.must_equal "2001-11-11"
  end

  it "should return a correct partial date string" do
    Circa::Date.new("2001-11-00").to_s.must_equal "2001-11-00"
  end

  it "should return valid date parts for a complete date" do
    parts = Circa::Date.new("2001-11-01").valid_parts
    parts.must_equal({ :year => "2001", :month => "11", :day => "01" })
  end

  it "should return valid date parts for a partial date" do
    parts = Circa::Date.new("2001-11-00").valid_parts
    parts.must_equal({ :year => "2001", :month => "11" })
  end

  it "should return a correct date given a correct date string" do
    date = Circa::Date.new("2001-11-11").to_date
    date.must_equal Date.new(2001, 11, 11)
  end

  it "should return a correct date given a partial date" do
    date = Circa::Date.new("2001-11-00").to_date
    date.must_equal Date.new(2001, 11, 01)
  end

  it "should return nil on to_date given a zero date" do
    date = Circa::Date.new("0000-00-00").to_date
    date.must_be_nil
  end
end
