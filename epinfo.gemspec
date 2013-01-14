# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'epinfo/version'

Gem::Specification.new do |gem|
  gem.name          = "epinfo"
  gem.version       = EPInfo::VERSION
  gem.authors       = ["takahashim"]
  gem.email         = ["maki@rubycolor.org"]
  gem.description   = %q{command line tool to show epub information}
  gem.summary       = %q{command line tool to show epub information}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
