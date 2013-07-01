# Circa

Use MySQL-style partial dates in Rails (and elsewhere).

```ruby
$ date = circa('2001-01-00')
$ date.valid_parts
{ year: '2001', month: '01' }
$ date.to_date.to_s
'2001-01-01'
$ time = circa('2001-01-11 13:30:00')
$ time.valid_parts
{ year: '2001', month: '01', day: '11', hour: '13', minute: '30', second: '00' }
```

## Installation

    $ gem install circa
