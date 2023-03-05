# bestchange-api

bestchange-api is a simple library for getting data from Bestchange aggregator

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bestchange-api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install bestchange-api

## Usage

Add your own configuration or use the default one

```ruby
require 'bestchange'

Bestchange.configure do |config|
  config.dir = "path/to/your/custom/folder" # default is Dir.pwd
  config.timeout = 20 # Timeout for getting & parsing data, default is 40
end
```

Fetch data
```ruby
Bestchange::Api.get_files(['bm_rates.dat']) # => [File] 
```

**NOTE**:  API documentation is described here [API_DOC.txt](https://github.com/karpinovsky/bestchange-api/blob/master/API_DOC.txt)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the bestchange-api project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/karpinovsky/bestchange-api/blob/master/CODE_OF_CONDUCT.md).
