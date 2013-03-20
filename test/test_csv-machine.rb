require 'test/unit'

$:.unshift File.expand_path('../lib', File.dirname(__FILE__))
require 'csv-machine'

class Bar
  include CSVMachine

  #set_column_sep "~"
  #set_row_sep '\n'
  #set_quote_char '"'
  #set_force_quotes false
  #set_skip_blanks false

  field :a 
  field :c, column: 2
  field :d
  field :e
end

class TestCSVMachine < Test::Unit::TestCase

  def setup
  end

  def test_column_numbers
    assert_equal(0, Bar.csv_fields[:a].column) 
    assert_equal(2, Bar.csv_fields[:c].column) 
    assert_equal(3, Bar.csv_fields[:d].column) 
    assert_equal(4, Bar.csv_fields[:e].column) 
  end

  def test_csv_options
    assert_equal(CSV::DEFAULT_OPTIONS, Bar.csv_options)
  end

end
