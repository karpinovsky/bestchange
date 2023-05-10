# frozen_string_literal: true

require 'zip'

module Bestchange
  class ZipExtractor
    def initialize(zip_file, on_extract: nil)
      @zip_file = zip_file
      @on_extract = on_extract
    end

    def call(filename)
      tempfile = Tempfile.new(filename)

      Zip::File.open(@zip_file) do |zip_file|
        entry = zip_file.find_entry(filename)

        @on_extract&.call(entry)
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
