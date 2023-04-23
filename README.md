
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

### info.zip

```ruby
require 'bestchange'

api_client = Bestchange::Api.new
response = api_client.request # this will call api.bestchange.ru/info.zip by default
archive = Bestchange::ZipBuilder.new(response.body).call
tempfile = Bestchange::ZipExtractor.new(archive).call('bm_rates.dat')
```

**NOTE**: Do not forget to close and unlink files at the end
```ruby
archive.close
tempfile.close
```

### Using blocks
The `Bestchange::ZipBuilder` and `Bestchange::ZipExtractor` classes support using blocks to ensure that tempfiles are closed automatically. This is useful when you want to avoid manual file management and prevent possible leaks
```ruby
response = Bestchange::Api.new.request

Bestchange::ZipBuilder.new(response.body).call do |archive|
  # Work with archive here
  # archive will be closed automatically when the block finishes
  Bestchange::ZipExtractor.new(archive).call('bm_rates.dat') do |bm_rates|
    # Work with bm_rates here
    # bm_rates will be closed automatically when the block finishes
  end
end
```

### Custom connection
You can pass your own http connection object while initializing an api client. This can be useful if you want to set custom timeouts, for example
```ruby
require  'bestchange'

uri = URI(Bestchange::Api::BASE_URI)
conn = Net::HTTP.new(uri.host, uri.port)
conn.open_timeout = 5
conn.read_timeout = 10
api_client = Bestchange::Api.new(conn)
```

### Custom request
You can provide your own http request object to the `#request` method
```ruby
require  'bestchange'

request = Net::HTTP::Head.new(URI(Bestchange::Api::BASE_URI))
response = api_client.request(request)
created_at = response['Date']
```


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the bestchange-api project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/karpinovsky/bestchange-api/blob/master/CODE_OF_CONDUCT.md).
