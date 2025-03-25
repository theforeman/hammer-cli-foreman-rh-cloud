module HammerCLIForemanRhCloud
  class InventoryCommand < HammerCLIForeman::Command
    desc 'Manage inventory related operations'
    resource :inventory
    command_name 'inventory'

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

    class DownloadCommand < HammerCLIForeman::DownloadCommand
      command_name 'download-report'
      desc 'Download the last generated report'

      action :download_file

      option '--path', 'PATH',
        _('Path to download report.'),
        attribute_name: :option_path,
        required: true

      failure_message _('Failed to download report')

      build_options
    end

    class GenerateCommand < HammerCLIForeman::Command
      command_name 'generate-report'
      action :generate_report
      desc 'Start new report generation'

      option ['--no-upload'], :flag, _('Generate the report, but do not upload')
      success_message _('Report generation started successfully')
      failure_message _('Failed to start report generation task, please check server logs for more information.')

      build_options
    end

    autoload_subcommands
  end
end
