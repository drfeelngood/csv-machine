require 'test/unit'

$:.unshift File.expand_path('../lib', File.dirname(__FILE__))
require 'csv-machine'

class AllStar
  include CSVMachine

  #set_column_sep "~"
  #set_row_sep '\n'
  #set_quote_char '"'
  #set_force_quotes false
  #set_skip_blanks false

  field :last_name
  field :first_name
  field :team, column: 4
end

class TestCSVMachine < Test::Unit::TestCase

  def test_column_numbers
    assert_equal(0, AllStar.csv_fields[:last_name].column) 
    assert_equal(1, AllStar.csv_fields[:first_name].column) 
    assert_equal(4, AllStar.csv_fields[:team].column) 
  end

  def test_csv_options
    assert_equal(CSV::DEFAULT_OPTIONS, AllStar.csv_options)
  end

  def test_parse
    data = <<-CSV
Durant,Kevin,Small Forward,35,Oklahoma City Thunder
Bryant,Kobe,Shooting Guard,24,Los Angeles Lakers
James,LeBron,Power Forward,6,Miami Heat
CSV
    @all_stars = []
    assert_nothing_raised do
      @all_stars = AllStar.parse(data)
    end
    assert_equal(3, @all_stars.size)
    @all_stars.each do |all_star|
      assert_instance_of(AllStar, all_star)

      assert_respond_to(all_star, :first_name)
      assert_respond_to(all_star, :last_name)
      assert_respond_to(all_star, :team)
    end
    player = @all_stars.first
    assert_equal("Kevin", player.first_name)
    assert_equal("Durant", player.last_name)
    assert_equal("Oklahoma City Thunder", player.team)
  end

  def test_parse_with_custom_csv_option
    data = <<-CSV
Last name, First name, Position, Number, Team
Durant,Kevin,Small Forward,35,Oklahoma City Thunder
Bryant,Kobe,Shooting Guard,24,Los Angeles Lakers
James,LeBron,Power Forward,6,Miami Heat
CSV
    @all_stars = []
    assert_nothing_raised do
      AllStar.set_csv_option(:headers, :first_row)
      @all_stars = AllStar.parse(data)
    end
    assert_equal(3, @all_stars.size)
    @all_stars.each do |all_star|
      assert_instance_of(AllStar, all_star)

      assert_respond_to(all_star, :first_name)
      assert_respond_to(all_star, :last_name)
      assert_respond_to(all_star, :team)
    end
    player = @all_stars.first
    assert_equal("Kevin", player.first_name)
    assert_equal("Durant", player.last_name)
    assert_equal("Oklahoma City Thunder", player.team)
  end

end
