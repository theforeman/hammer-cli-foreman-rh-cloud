# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/spec'
require 'mocha/minitest'
require 'hammer_cli/testing/command_assertions'
require 'hammer_cli/testing/output_matchers'
require 'hammer_cli'
require 'hammer_cli_foreman/testing/api_expectations'
require File.join(File.dirname(__FILE__), './task_helper.rb')
FOREMAN_VERSION = Gem::Version.new(ENV['TEST_API_VERSION'] || '3.15')

include HammerCLIForeman::Testing::APIExpectations
HammerCLI.context[:api_connection].create('foreman') do
  api_connection({}, FOREMAN_VERSION)
end

include HammerCLI::Testing::CommandAssertions
include HammerCLI::Testing::OutputMatchers

require 'hammer_cli_foreman_rh_cloud'
