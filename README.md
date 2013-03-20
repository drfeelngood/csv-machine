# CSVMachine

Inspired by [pauldix/sax-machine](https://github.com/pauldix/sax-machine), this library helps in parsing csv data.

## Example

```ruby
class AllStar 
  include CSVMachine

  field :first_name
  field :last_name
  field :team, column: 4
end


records = AllStar.parse("/path/to/allstars.csv")
records.each do |record|
  puts ( "first_name[%s] last_name[%s] team[%s]" % [ record.first_name,
            record.last_name, record.team ] )
end

__END__
first_name[Kevin] last_name[Durant] team[Oklahoma City Thunder]
first_name[Kobe] last_name[Bryant] team[Los Angeles Lakers]
first_name[Lebron] last_name[James] team[Miami Heat]
```
