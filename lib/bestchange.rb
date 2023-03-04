# frozen_string_literal: true

require_relative 'bestchange/api'
require_relative 'bestchange/configuration'

module Bestchange
  ARCHIVE_DATA_FILENAME = 'info.zip'
  ARCHIVE_DATA_ENCODING = 'ASCII-8BIT'

  BASE_URI = "http://api.bestchange.ru/#{ARCHIVE_DATA_FILENAME}".freeze

  DIRECTORY = Dir.pwd
  TIMEOUT = 40

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      return configuration unless block_given?

      yield(configuration)
    end
  end
end
