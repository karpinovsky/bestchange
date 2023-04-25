# frozen_string_literal: true

require_relative 'test_helper'

class ApiTest < Minitest::Test
  def test_request_returns_net_http_response
    uri = URI.parse(Bestchange::Api::BASE_URI)

    http_response = Net::HTTPOK.new(1.0, '200', 'OK')
    http_response['Content-Type'] = 'application/zip'

    http_mock = Minitest::Mock.new
    http_mock.expect(:request, http_response, [Net::HTTP::Get])

    api_client = Bestchange::Api.new(http_mock)

    response = api_client.request

    assert_kind_of Net::HTTPSuccess, response
    assert_equal 'application/zip', response['Content-Type']

    http_mock.verify
  end
end
