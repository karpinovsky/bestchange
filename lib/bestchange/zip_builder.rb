# frozen_string_literal: true

module Bestchange
  class ZipBuilder
    ARCHIVE_DATA_ENCODING = 'ASCII-8BIT'

    def initialize(response_body)
      @response_body = response_body
    end

    def call
      zip_file = Tempfile.new('', encoding: ARCHIVE_DATA_ENCODING)
      zip_file.write(@response_body)
      zip_file.rewind

      if block_given?
        begin
          yield zip_file
        ensure
          zip_file.close
        end
      else
        zip_file
      end
    end
  end
end
