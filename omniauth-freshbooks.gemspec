# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'omniauth/freshbooks/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-freshbooks'
  spec.version       = OmniAuth::Freshbooks::VERSION
  spec.authors       = ['Yacin Bahi']
  spec.email         = ['yacin@ybsis.com']
  spec.summary       = 'FreshBooks strategy for OmniAuth'
  spec.description   = 'FreshBooks strategy for OmniAuth using the new FreshBooks API'
  spec.homepage      = 'https://github.com/yacc/omniauth-freshbooks'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth', '~> 1.5'
  spec.add_dependency 'omniauth-oauth2', '>= 1.4.0', '< 2.0'

  spec.add_development_dependency 'rake', '~> 11.3'
  spec.add_development_dependency 'rspec', '~> 3.1'
end
