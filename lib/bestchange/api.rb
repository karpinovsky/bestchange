# frozen_string_literal: true

require 'open-uri'
require 'net/http'
require 'tempfile'
require 'timeout'
require 'zip'

module Bestchange
  module Api
    extend self

    def get_files(filenames, &before_extract)
      Timeout.timeout(Bestchange.configuration.timeout) do
        fetch_files(filenames, &before_extract)
      end
    end

    private

    def fetch_files(filenames, &before_extract)
      response = make_request

      archive = Tempfile.new(ARCHIVE_DATA_FILENAME, encoding: ARCHIVE_DATA_ENCODING)
      archive.write(response)

      extract_files('info.zip', filenames, &before_extract)
    ensure
      archive.close if defined?(archive)
    end

    def make_request
      Net::HTTP.get(URI(BASE_URI))
    end

    def extract_files(archive, filenames, &before_extract)
      Zip::File.open(archive) do |zip_file|
        filenames.map do |filename|
          entry = zip_file.find_entry(filename)

          pathname = Pathname.new(Bestchange.configuration.dir).join(filename)

          before_extract&.call(filename, pathname)

          zip_file.extract(entry, pathname)

          pathname.open
        end
      end
    end
  end
end
