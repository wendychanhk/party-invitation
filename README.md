# Party Invitation
## Specification

We have some customer records in a text file (customers.txt) -- one customer per line, JSON lines formatted. We want to invite any customer within 100km of our Dublin office for some food and drinks on us. Write a program that will read the full list of customers and output the names and user ids of matching customers (within 100km), sorted by User ID (ascending).

You can use the first formula from this [Wikipedia article](https://en.wikipedia.org/wiki/Great-circle_distance) to calculate distance. Don't forget, you'll need to convert degrees to radians.
The GPS coordinates for our Dublin office are 53.339428, -6.257664.

## Setup and Run the Programme

```
$ git clone https://github.com/wendychanhk/party-invitation.git
$ cd party-invitation
$ bundle install
$ ruby start.rb

```

## How to Run Spec

```ruby
$ bundle exec rspec spec

```

## Reference

* [geocoder gem](http://www.rubygeocoder.com/) for calculating geographical distance
