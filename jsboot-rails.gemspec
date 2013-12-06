# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jsboot/rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Brendon Murphy"]
  gem.email         = ["xternal1+github@gmail.com"]
  gem.description   = %q{a small solution for removing all inline javascript from your views}
  gem.summary       = %q{a small solution for removing all inline javascript from your views}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "jsboot-rails"
  gem.require_paths = ["lib"]
  gem.version       = Jsboot::Rails::VERSION

  gem.add_dependency "rails", "> 3.2.12"
  gem.add_development_dependency "sqlite3"
end
