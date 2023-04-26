# frozen_string_literal: true

require_relative 'lib/bestchange/version'

Gem::Specification.new do |spec|
  spec.name = 'bestchange'
  spec.summary = 'Bestchange client'
  spec.description = 'A simple library for getting data from Bestchange aggregator'

  spec.version = Bestchange::VERSION
  spec.required_ruby_version = Gem::Requirement.new('>= 3.1.3')

  spec.authors = ['Kirill Karpinovsky']
  spec.email = 'karpinovsky@gmail.com'

  spec.homepage = 'https://github.com/karpinovsky/bestchange'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['bug_tracker_uri'] = "#{spec.homepage}/issues"
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  spec.extra_rdoc_files = Dir['README.md', 'CHANGELOG.md', 'LICENSE.txt']

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.require_paths = ['lib']

  spec.add_dependency 'rubyzip', '2.3.2'

  spec.add_development_dependency 'minitest', '5.17.0'
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'pry', '0.14.2'
  spec.add_development_dependency 'rubocop', '1.47.0'

  spec.license = 'MIT'
end
