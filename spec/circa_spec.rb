# encoding: UTF-8

require 'minitest/spec'
require_relative '../lib/circa'

describe Circa do

  before do
    class Circafied
      include Circa
    end
    @circafied = Circafied.new
  end

  it 'should return a new Circa::Date via a convenience method' do
    d = @circafied.circa('2001-11-11')
    d.must_be_instance_of Circa::Date
  end

  it 'should return a new Circa::Time via a convenience method' do
    d = @circafied.circa('2001-11-11 13:30:30')
    d.must_be_instance_of Circa::Time
  end
end
