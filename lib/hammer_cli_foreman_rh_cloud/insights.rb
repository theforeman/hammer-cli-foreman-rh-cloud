require 'hammer_cli_foreman_rh_cloud/inventory'
require 'hammer_cli_foreman_rh_cloud/cloud_connector'

module HammerCLIForemanRhCloud
  class InsightsCommand < HammerCLIForeman::Command
    resource :inventory
    autoload_subcommands

    subcommand HammerCLIForemanRhCloud::InventoryCommand.command_name,
      HammerCLIForemanRhCloud::InventoryCommand.desc,
      HammerCLIForemanRhCloud::InventoryCommand

    subcommand HammerCLIForemanRhCloud::CloudConnectorCommand.command_name,
      HammerCLIForemanRhCloud::CloudConnectorCommand.desc,
      HammerCLIForemanRhCloud::CloudConnectorCommand
  end
end
