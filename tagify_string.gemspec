# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tagify_string/version'

#noinspection RubyLiteralArrayInspection

Gem::Specification.new do |gem|
  gem.name          = "tagify_string"
  gem.version       = TagifyString::VERSION
  gem.authors       = ["Ray Parker"]
  gem.email         = ["rayparkerbassplayer@gmail.com"]
  gem.description   = %q{Adds 'tagify' and 'tagify!' to the Ruby string class.  This is pretty much 'parameterize', but upper case by default.}
  gem.summary       = %q{This is reasonably trivial functionality being split off into a gem for the purpose of consistency throughout a number of Shermans applications.  This give Shermans the ability to take any string and 'tagify' it so that it is a predictable and typeable (in the keyboard sense) string for writing custom queries and reports on the SailThru web site.}
  gem.homepage      = ""

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "i18n"
  gem.add_development_dependency "active_support"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
