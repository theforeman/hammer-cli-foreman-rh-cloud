require 'hammer_cli_foreman_rh_cloud/inventory'

module HammerCLIForemanRhCloud
  class InsightsCommand < HammerCLIForeman::Command
    resource :inventory
    autoload_subcommands

    subcommand HammerCLIForemanRhCloud::InventoryCommand.command_name,
      HammerCLIForemanRhCloud::InventoryCommand.desc,
      HammerCLIForemanRhCloud::InventoryCommand
  end
end
