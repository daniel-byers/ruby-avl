require File.expand_path('../lib/ruby-avl/version', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'ruby-avl'
  s.version       = AVL::VERSION
  s.date          = '2016-04-30'
  s.description   = s.summary = 'A simple AVL Tree implemented in Ruby'
  s.authors       = ['Daniel Byers']
  s.email         = 'daniel_byers@hotmail.co.uk'
  s.homepage      = 'http://rubygems.org/gems/ruby-avl'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test}/*`.split("\n")
  s.require_path  = 'lib'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-given'
end