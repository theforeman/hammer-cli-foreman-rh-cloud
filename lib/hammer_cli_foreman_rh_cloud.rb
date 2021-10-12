module HammerCLIForemanRhCloud
  require 'hammer_cli'
  require 'hammer_cli_foreman'

  require 'hammer_cli_foreman_rh_cloud/version'
  require 'hammer_cli_foreman_rh_cloud/report'

  HammerCLI::MainCommand.lazy_subcommand(
    'rh_report',
    'Manage reports sent to console.redhat.com',
    'HammerCLIForemanRhCloud::ReportCommand',
    'hammer_cli_foreman_rh_cloud/report'
  )

  HammerCLI::MainCommand.lazy_subcommand(
    'rh_cloud_inventory',
    'Manage inventory synchroniztion with console.redhat.com',
    'HammerCLIForemanRhCloud::InventoryCommand',
    'hammer_cli_foreman_rh_cloud/inventory'
  )

  HammerCLI::MainCommand.lazy_subcommand(
    'cloud_connector',
    'Manage Cloud Connector',
    'HammerCLIForemanRhCloud::CloudConnectorCommand',
    'hammer_cli_foreman_rh_cloud/cloud_connector'
  )
end
