# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jquery/watcher/version'

Gem::Specification.new do |spec|
  spec.name                  = 'jquery-watcher'
  spec.version               = Jquery::Watcher::VERSION
  spec.authors               = ['Florian Schwab']
  spec.email                 = ['me@ydkn.de']

  spec.summary               = %q{Allow initialization of javascript code regardless of document.ready, turbolinks or dom changes (e.g. Ajax).}
  spec.description           = %q{Allow initialization of javascript code regardless of document.ready, turbolinks or dom changes (e.g. Ajax).}
  spec.homepage              = 'https://github.com/ydkn/jquery-watcher'
  spec.license               = 'MIT'

  spec.required_ruby_version = '>= 2.4.0'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'coffee-rails', '>= 4.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
