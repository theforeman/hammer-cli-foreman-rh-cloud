lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hammer_cli_foreman_rh_cloud/version'

Gem::Specification.new do |spec|
  spec.name          = 'hammer_cli_foreman_rh_cloud'
  spec.version       = HammerCLIForemanRhCloud.version.dup
  spec.authors       = [
    'Shimon Shtein',
    'Chris Roberts',
    'Ewoud Kohl van Wijngaarden',
    'Archana Kumari',
    'Oleh Fedorenko',
    'Partha Aji',
  ]
  spec.email         = ['sshtein@redhat.com']
  spec.homepage      = 'https://github.com/theforeman/hammer-cli-foreman-rh-cloud'
  spec.license       = 'GPL-3.0-or-later'

  spec.platform      = Gem::Platform::RUBY
  spec.summary       = 'Foreman Rh Cloud plugin for Hammer CLI'

  spec.files         = Dir['{lib,config}/**/*', 'LICENSE', 'README*'] + Dir['locale/**/*.{po,pot,mo}']
  spec.require_paths = ['lib']
  spec.test_files    = Dir['{test}/**/*']

  spec.add_dependency 'hammer_cli_katello', '< 2.0'

  spec.required_ruby_version = '>= 2.7', '< 4'

  spec.add_development_dependency 'ci_reporter', '>= 1.6.3', '< 2.0.0'
  spec.add_development_dependency 'gettext', '>= 3.1.3', '< 4.0.0'
  spec.add_development_dependency 'minitest', '4.7.4'
  spec.add_development_dependency 'minitest-spec-context', '~> 0.0.5'
  spec.add_development_dependency 'mocha', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'theforeman-rubocop', '~> 0.1.0'
  spec.add_development_dependency 'thor', '~> 1.0'
end
