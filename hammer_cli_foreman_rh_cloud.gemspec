lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hammer_cli_foreman_rh_cloud/version'

Gem::Specification.new do |spec|
  spec.name          = 'hammer_cli_foreman_rh_cloud'
  spec.version       = HammerCLIForemanRhCloud.version.dup
  spec.authors       = ['Shimon Shtein']
  spec.email         = ['sshtein@redhat.com']
  spec.homepage      = 'https://github.com/theforeman/hammer-cli-foreman-rh-cloud'
  spec.license       = 'GPL-3.0'

  spec.platform      = Gem::Platform::RUBY
  spec.summary       = 'Foreman Rh Cloud plugin for Hammer CLI'

  spec.files         = Dir['{lib,config}/**/*', 'LICENSE', 'README*'] + Dir['locale/**/*.{po,pot,mo}']
  spec.require_paths = ['lib']
  spec.test_files    = Dir['{test}/**/*']

  spec.add_dependency 'hammer_cli_foreman', '>= 3.0.0', '< 4.0.0'
end
