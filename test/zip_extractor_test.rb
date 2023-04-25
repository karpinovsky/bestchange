# frozen_string_literal: true

require_relative 'test_helper'

class ZipExtractorTest < Minitest::Test
  def test_get_files_returns_tempfiles_with_correct_content
    sample_zip = Tempfile.new('sample.zip')
    filename = 'file.txt'
    file_content = 'File content'

    Zip::File.open(sample_zip.path, Zip::File::CREATE) do |zipfile|
      zipfile.get_output_stream(filename) { |f| f.write(file_content) }
    end

    tempfile = Bestchange::ZipExtractor.new(sample_zip).call(filename)

    assert_equal file_content, tempfile.read
  end
end
