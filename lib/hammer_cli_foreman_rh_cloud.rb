module HammerCLIForemanRhCloud
  require 'hammer_cli'
  require 'hammer_cli_foreman'

  require 'hammer_cli_foreman_rh_cloud/version'
  require 'hammer_cli_foreman_rh_cloud/i18n'
  require 'hammer_cli_foreman_rh_cloud/insights'
  require 'hammer_cli_foreman_rh_cloud/command_extensions/ping'

  HammerCLI::MainCommand.lazy_subcommand(
    'insights',
    'Manage Insights related operations',
    'HammerCLIForemanRhCloud::InsightsCommand',
    'hammer_cli_foreman_rh_cloud/insights'
  )
end
