# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'omniauth/freshbooks/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-freshbooks-oauth2'
  spec.version       = OmniAuth::Freshbooks::VERSION
  spec.authors       = ['Kevin Pheasey']
  spec.email         = ['kevin@kpheasey.com']
  spec.summary       = 'FreshBooks OAuth2 strategy for OmniAuth'
  spec.description   = 'FreshBooks OAuth2 strategy for OmniAuth'
  spec.homepage      = 'https://github.com/kp-software/omniauth-freshbooks-oauth2'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth', '~> 1.2'
  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
