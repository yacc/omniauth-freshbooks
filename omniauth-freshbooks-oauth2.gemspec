# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'omniauth/freshbooks/version'

Gem::Specification.new do |s|
  s.name          = 'omniauth-freshbooks-oauth2'
  s.version       = OmniAuth::Freshbooks::VERSION
  s.authors       = ['Kevin Pheasey']
  s.email         = ['kevin@kpheasey.com']
  s.summary       = 'FreshBooks OAuth2 strategy for OmniAuth'
  s.description   = 'FreshBooks OAuth2 strategy for OmniAuth'
  s.homepage      = 'https://github.com/kp-software/omniauth-freshbooks-oauth2'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split('\n')
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split('\n')
  s.executables   = `git ls-files -- bin/*`.split('\n').collect { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth', '~> 1.2'
  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
