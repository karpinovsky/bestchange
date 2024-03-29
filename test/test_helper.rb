# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

require_relative '../lib/bestchange'

require 'pry'
