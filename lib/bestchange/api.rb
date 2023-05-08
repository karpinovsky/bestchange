# frozen_string_literal: true

require 'open-uri'
require 'net/http'
require 'tempfile'
require 'timeout'
require 'zip'

module Bestchange
  class Api
    BASE_URI = 'http://api.bestchange.ru/info.zip'
    BASE_CONNECTION = Net::HTTP.new(URI(BASE_URI).host, URI(BASE_URI).port)
    BASE_REQUEST = Net::HTTP::Get.new(URI(BASE_URI))

    def initialize(conn = BASE_CONNECTION)
      @conn = conn
    end

    attr_reader :conn

    def request(request = BASE_REQUEST)
      conn.request(request)
    end
  end
end
