# frozen_string_literal: true

require 'open-uri'
require 'net/http'
require 'tempfile'
require 'timeout'
require 'zip'

module Bestchange
  class Api
    BASE_URI = 'http://api.bestchange.ru/info.zip'

    def initialize(conn = default_conn)
      @conn = conn
    end

    attr_reader :conn

    def request(request = default_request)
      conn.request(request)
    end

    private

    def default_conn
      Net::HTTP.new(URI(BASE_URI).host, URI(BASE_URI).port)
    end

    def default_request
      Net::HTTP::Get.new(URI(BASE_URI))
    end
  end
end
