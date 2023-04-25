# frozen_string_literal: true

require_relative 'test_helper'

class ZipBuilderTest < Minitest::Test
  def test_call_returns_tempfile_with_correct_content
    example_response_body = 'example_zip_data'
    zip_builder = Bestchange::ZipBuilder.new(example_response_body)

    archive = zip_builder.call

    assert_instance_of Tempfile, archive
    assert_equal example_response_body, archive.read
  end
end
