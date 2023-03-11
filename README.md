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
[Bestchange api description](https://github.com/karpinovsky/bestchange-api/blob/master/API_DOC.txt)

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
### &before_extract
You can also pass a block that will be called before `Zip::Entry#extract`. It might be helpful if you need to remove existed files or change files destination for example
```ruby
before_extract = ->(_filename, pathname) do
  pathname.delete if pathname.exist?
end

Bestchange::Api.get_files(['bm_rates.dat'], &before_extract)
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the bestchange-api project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/karpinovsky/bestchange-api/blob/master/CODE_OF_CONDUCT.md).
