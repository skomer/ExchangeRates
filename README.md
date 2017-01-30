# Exchange Rates

## What is this app?
This application fetches currency exchange rate data from the European Central Bank's XML feed, stores that data to a database and provides a user interface for looking up exchange rate information on a particular date.

## Installation
Clone or download the app from this repo.

To run this application I will assume that you are using Mac OS X and that you have Ruby and Postgres installed.

To install the gems required run these commands in the command line:

```gem install sinatra```

```gem install sinatra-contrib```

```gem install pg```

```gem install minitest```

```gem install nokogiri```

```gem install open-uri```

## Creating the database
In the command line, navigate to the app's top level folder and run this command to create the postgres database:
```createdb exchange_rates```

... then this command to set up the new database:

```psql -d exchange_rates -f db/exchange_rates.sql```

## Running the tests
There are three test files in the app. To run the tests and make sure that they pass, enter these commands in the command line, one by one:

```ruby specs/rate_record_spec.rb```

```ruby specs/feed_spec.rb```

```ruby specs/exchange_rate_spec.rb```

## Run the app
Run this command in the command line:

```ruby main.rb```

... then in your browser go to [localhost:4567](localhost:4567)

Have fun!

## Credits
[Datepicker from jQueryUI datepicker](https://jqueryui.com/datepicker/)

[Nokogiri gem](http://www.nokogiri.org/)
