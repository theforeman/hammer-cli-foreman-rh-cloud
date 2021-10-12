module HammerCLIForemanRhCloud
  class InventoryCommand < HammerCLIForeman::Command
    resource :inventory
    command_name 'rh_cloud_inventory'

    class SyncCommand < HammerCLIForeman::Command
      command_name 'sync'
      action :sync_inventory_status
      desc 'Start inventory status sync'

      success_message _('Inventory sync task started successfully')
      failure_message _('Failed to start inventory sync task, please check server logs for more information')

      output do
        field :id, _('Task id')
      end

      build_options
    end

    autoload_subcommands
  end
end
