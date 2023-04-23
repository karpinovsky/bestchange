# frozen_string_literal: true

require 'zip'

module Bestchange
  class ZipExtractor
    def initialize(zip_file)
      @zip_file = zip_file
    end

    def call(filename)
      Zip::File.open(@zip_file) do |zip_file|
        entry = zip_file.find_entry(filename)

        tempfile = Tempfile.new(filename)

        entry.extract(tempfile) { true }
      end

      tempfile.rewind

      if block_given?
        begin
          yield tempfile
        ensure
          tempfile.close
        end
      else
        tempfile
      end
    end
  end
end
