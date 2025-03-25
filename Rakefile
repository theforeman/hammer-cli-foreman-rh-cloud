# frozen_string_literal: true

require 'rake/testtask'
require 'bundler/gem_tasks'
require 'ci/reporter/rake/minitest'

Rake::TestTask.new do |t|
  t.libs.push 'lib'
  t.test_files = Dir.glob('test/**/*_test.rb')
  t.verbose = true
  t.warning = ENV.key?('RUBY_WARNINGS')
end

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue StandardError => _e
  puts 'Rubocop not loaded.'
end

task :default do
  Rake::Task['rubocop'].execute
  Rake::Task['test'].execute
end

require 'hammer_cli_foreman_rh_cloud/version'
require 'hammer_cli_foreman_rh_cloud/i18n'
require 'hammer_cli/i18n/find_task'
HammerCLI::I18n::FindTask.define(HammerCLIForemanRhCloud::I18n::LocaleDomain.new, HammerCLIForemanRhCloud.version.to_s)
