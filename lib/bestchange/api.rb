# frozen_string_literal: true

require 'open-uri'
require 'net/http'
require 'tempfile'
require 'timeout'
require 'zip'

module Bestchange
  class Api
    def self.get_files(filenames)
      pathnames = filenames.map do |filename|
        Pathname.new(Bestchange.configuration.dir).join(filename)
      end

      Timeout.timeout(Bestchange.configuration.timeout) { fetch_data(pathnames) }

      pathnames.map do |pathname|
        File.open(pathname)
      end
    end

    def self.fetch_data(pathnames)
      response = Net::HTTP.get(URI(BASE_URI))

      temp_file = Tempfile.new(ARCHIVE_DATA_FILENAME, encoding: ARCHIVE_DATA_ENCODING)
      temp_file.write(response)

      Zip::File.open(temp_file) do |zip_file|
        pathnames.each do |pathname|
          entry = zip_file.find_entry(pathname.basename)

          pathname.delete if pathname.exist?

          zip_file.extract(entry, pathname)
        end
      end

      temp_file.close
    end
  end
end
