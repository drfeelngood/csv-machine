# CSVMachine

Inspired by [pauldix/sax-machine](https://github.com/pauldix/sax-machine), this library helps in parsing csv data.

## Example

```ruby
require 'csv-machine'

class AllStar
  include CSVMachine

  field :last_name
  field :first_name
  field :team, column: 4
end

data = <<-CSV
Durant,Kevin,Small Forward,35,Oklahoma City Thunder
Bryant,Kobe,Shooting Guard,24,Los Angeles Lakers
James,LeBron,Power Forward,6,Miami Heat
CSV

players = AllStar.parse(data)
players.each do |player|
  puts ( "first_name[%s] last_name[%s] team[%s]" % [ player.first_name,
            player.last_name, player.team ] )
end

__END__
first_name[Kevin] last_name[Durant] team[Oklahoma City Thunder]
first_name[Kobe] last_name[Bryant] team[Los Angeles Lakers]
first_name[LeBron] last_name[James] team[Miami Heat]
```
