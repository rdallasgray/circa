require_relative '../lib/circa'

describe Circa::Parser do

  DATE_FORMAT = "%Y-%m-%d"

  before do
    @correct_date = "2012-10-09"
    @incorrect_date = "2012-02-30"
    @edge_date = "2011-02-29"
    @garbled_date = "201-02-03"
    @padded_partial_date = "2011-00-00"
    @partial_date = "2011"
    @correct_time = "23:05:59"
    @incorrect_time = "24:05:59"
    @partial_time = "11:00"
    @padded_partial_time = "11:00:00"
    @utc_datetime = "#{@correct_date}T#{@correct_time}Z"
    @iso8601_datetime = "#{@correct_date} #{@correct_time}"
  end

  it "should return a correct iso8601 date string unchanged" do
    Circa::Parser.new(@correct_date).to_s.must_equal @correct_date
  end

  # Need to test:
  # if year is 0000 or nil, any non-nil-or-zero value for month/day is invalid
  # if month is 00 or nil, any non-nil-or-zero value for day is invalid
  # Must always check validity of day by testing to-and-from string

  # it "should raise an ArgumentError given an incorrect date" do
  #   lambda { Circa::PartialDate.new(@incorrect_date).date }.must_raise ArgumentError
  # end

  # it "should raise an ArgumentError given an (edge-case) incorrect date" do
  #   lambda { Circa::PartialDate.new(@edge_date).date }.must_raise ArgumentError
  # end

  # it "should raise an ArgumentError given a garbled date" do
  #   lambda { Circa::PartialDate.new(@garbled_date).date }.must_raise ArgumentError
  # end

  # it "should partialise a partial date string correctly" do
  #   Circa::PartialDate.new(@partial_date).date.must_equal "2011-00-00"
  # end

  # it "should partialise a padded partial date string correctly" do
  #   Circa::PartialDate.new(@padded_partial_date).date.must_equal "2011-00-00"
  # end

  # it "should return a correct time string" do
  #   Circa::PartialDate.new(@correct_time).time.must_equal @correct_time
  # end

  # it "should return a correct time string from a utc datetime string" do
  #   Circa::PartialDate.new(@utc_datetime).time.must_equal @correct_time
  # end

  # it "should raise an ArgumentError given an incorrect time" do
  #   lambda { Circa::PartialDate.new(@incorrect_time).time }.must_raise ArgumentError
  # end

  # it "should partialise a partial time string correctly" do
  #   Circa::PartialDate.new(@partial_time).time.must_equal "11:00:00"
  # end

  # it "should partialise a padded partial time string correctly" do
  #   Circa::PartialDate.new(@padded_partial_time).time.must_equal "11:00:00"
  # end

  # it "should partialise a utc datetime string to an iso8601 datetime string" do
  #   Circa::PartialDate.new(@utc_datetime).datetime.must_equal @iso8601_datetime
  # end

  # it "should return a correct date given a correct date string" do
  #   date = Circa::PartialDate.new(@correct_date).to_date
  #   date.strftime(DATE_FORMAT).must_equal @correct_date
  # end

  # it "should return a correct date given a partial date string" do
  #   date = Circa::PartialDate.new(@partial_date).to_date
  #   date.strftime(DATE_FORMAT).must_equal "2011-01-01"
  # end

  # it "should return a correct date given a padded partial date string" do
  #   date = Circa::PartialDate.new(@padded_partial_date).to_date
  #   date.strftime(DATE_FORMAT).must_equal "2011-01-01"
  # end

  # it "should return correct valid date parts" do
  #   date_parts = Circa::PartialDate.new(@correct_date).valid_date_parts
  #   valid_parts = { :year => "2012", :month => "10", :day => "09" }
  #   date_parts.must_equal valid_parts
  # end

  # it "should return correct valid date parts for a partial date" do
  #   date_parts = Circa::PartialDate.new(@partial_date).valid_date_parts
  #   valid_parts = { :year => "2011" }
  #   date_parts.must_equal valid_parts
  # end

  # it "should return correct valid date parts for a padded partial date" do
  #   date_parts = Circa::PartialDate.new(@padded_partial_date).valid_date_parts
  #   valid_parts = { :year => "2011" }
  #   date_parts.must_equal valid_parts
  # end

  # it "should return correct valid time parts given a correct datetime" do
  #   time_parts = Circa::PartialDate.new(@utc_datetime).valid_time_parts
  #   valid_parts = { :hour => "23", :minute => "05", :second => "59", :meridian => "pm"}
  #   time_parts.must_equal valid_parts
  # end
end
