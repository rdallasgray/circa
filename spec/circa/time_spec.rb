# encoding: UTF-8

require 'minitest/spec'
require_relative '../../lib/circa/time'

describe Circa::Time do

  before do
    @correct_time = '2001-11-11 13:30:30'
    @incorrect_time = '2001-11-11 24:30:30'
    @zero_day = '2001-11-00 13:30:30'
    @utc = '2001-11-11T13:30:30Z'
    @partial_time = '2001-11-00 00:00:00'
  end

  it 'should return a correct time string intact' do
    Circa::Time.new(@correct_time).to_s.must_equal @correct_time
  end

  it 'should return a partial time string intact' do
    Circa::Time.new(@partial_time).to_s.must_equal @partial_time
  end

  it 'should reject an incorrect time string' do
    -> { Circa::Time.new(@incorrect_time) }.must_raise ArgumentError
  end

  it 'should reject a time with a zero day' do
    -> { Circa::Time.new(@zero_day) }.must_raise ArgumentError
  end

  it 'should accept a UTC time string' do
    Circa::Time.new(@utc).to_s.must_equal @correct_time
  end

  it 'should return valid parts' do
    t = Circa::Time.new(@correct_time)
    valid_parts = {
      year: '2001', month: '11', day: '11',
      hour: '13', minute: '30', second: '30'
    }
    t.valid_parts.must_equal valid_parts
  end

  it 'should return a correct datetime given a correct time' do
    t = Circa::Time.new(@correct_time)
    t.to_time.must_equal DateTime.new(2001, 11, 11, 13, 30, 30)
  end

  it 'should return a correct datetime given a partial time' do
    t = Circa::Time.new(@partial_time)
    t.to_time.must_equal DateTime.new(2001, 11, 1, 0, 0, 0)
  end
end
