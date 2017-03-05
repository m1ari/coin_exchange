# CoinExchange

Access to the CoinExchange API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coin_exchange'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coin_exchange

## Usage

To get the current details for a market ...

The V1 API currently has four calls
- [x] getmarkets (results will be cached as they don't often change)
- [ ] getmarketsummaries
- [ ] getmarketsummary
- [ ] getorderbook

In future it'll be possible to cache other calls and the cache time will be adjustable

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/m1ari/coin_exchange.

