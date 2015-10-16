# -*- encoding: utf-8 -*-
require File.expand_path('../lib/object-let/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["ronen barzel"]
  gem.email         = ["ronen@barzel.org"]
  gem.description   = %q{Defines Object#let, which yields the object and returns the result}
  gem.summary       = %q{Defines Object#let, which yields the object and returns the result.  This idiom can be handy to eliminate the need for an intermediate variable when you need to use the result of a computation multiple times.}
  gem.homepage      = 'http://github.com/ronen/object-let'
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "object-let"
  gem.require_paths = ["lib"]
  gem.version       = ObjectLet::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', "~> 3.0"
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'simplecov-gem-adapter'
end
