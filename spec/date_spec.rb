# encoding: UTF-8

require 'minitest/spec'
require 'circa/date'

describe Circa::Date do

  before do
    @correct_date = '2001-11-11'
    @zero_year = '0000-11-11'
    @zero_month = '2001-00-11'
    @incorrect_date = '2001-02-30'
    @partial_date = '2001-11-00'
    @zero_date = '0000-00-00'
  end

  it 'should reject a date with a zero year and non-zero month' do
    -> { Circa::Date.new(@zero_year) }.must_raise ArgumentError
  end

  it 'should reject a date with a zero month and non-zero day' do
    -> { Circa::Date.new(@zero_month) }.must_raise ArgumentError
  end

  it 'should reject an incorrect date' do
    -> { Circa::Date.new(@incorrect_date) }.must_raise ArgumentError
  end

  it 'should return a correct date string intact' do
    Circa::Date.new(@correct_date).to_s.must_equal '2001-11-11'
  end

  it 'should return a correct partial date string' do
    Circa::Date.new(@partial_date).to_s.must_equal '2001-11-00'
  end

  it 'should return valid date parts for a complete date' do
    parts = Circa::Date.new(@correct_date).valid_parts
    parts.must_equal({ year: '2001', month: '11', day: '11' })
  end

  it 'should return valid date parts for a partial date' do
    parts = Circa::Date.new(@partial_date).valid_parts
    parts.must_equal({ year: '2001', month: '11' })
  end

  it 'should return a correct date given a correct date string' do
    date = Circa::Date.new(@correct_date).to_date
    date.must_equal Date.new(2001, 11, 11)
  end

  it 'should return a correct date given a partial date' do
    date = Circa::Date.new(@partial_date).to_date
    date.must_equal Date.new(2001, 11, 01)
  end

  it 'should return nil on to_date given a zero date' do
    date = Circa::Date.new(@zero_date).to_date
    date.must_be_nil
  end
end
