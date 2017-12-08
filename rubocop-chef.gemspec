$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'rubocop/chef/version'

Gem::Specification.new do |spec|
  spec.name = 'rubocop-chef'
  spec.summary = 'Code style checking for Chef cookbooks'
  spec.description = spec.summary
  spec.homepage = 'https://github.com/poise/rubocop-chef'
  spec.authors = ['Noah Kantrowitz', 'Tim Smith']
  spec.email = ['noah@coderanger.net', 'tsmith@chef.io']
  spec.licenses = ['Apache 2.0', 'MIT']

  spec.version = RuboCop::Chef::VERSION
  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.1.0'

  spec.require_paths = ['lib']
  spec.files = Dir[
    '{config,lib,spec}/**/*',
    '*.md',
    '*.gemspec',
    'Gemfile',
    'Rakefile'
  ]
  spec.test_files = spec.files.grep(%r{^spec/})
  spec.extra_rdoc_files = ['MIT-LICENSE.md', 'README.md']

  spec.add_runtime_dependency 'rubocop', '>= 0.39'

  spec.add_development_dependency 'adamantium'
  spec.add_development_dependency 'anima'
  spec.add_development_dependency 'concord'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '>= 3.4'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'yard'
end
