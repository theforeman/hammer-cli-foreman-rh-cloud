module HammerCLIForemanRhCloud
  class CloudConnectorCommand < HammerCLIForeman::Command
    desc 'Manage cloud connector setup'
    resource :inventory
    command_name 'cloud-connector'

    class EnableCommand < HammerCLIForeman::Command
      command_name 'enable'
      action :enable_cloud_connector
      desc 'Enable cloud connector'

      success_message _('Cloud connector enable task started')
      failure_message _('Failed to enable cloud connector, please check server logs for more information')

      output do
        field :task_id, _('Task id')
      end

      build_options
    end

    autoload_subcommands
  end
end
