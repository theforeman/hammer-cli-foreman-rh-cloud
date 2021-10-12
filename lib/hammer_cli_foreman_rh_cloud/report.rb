module HammerCLIForemanRhCloud
  class ReportCommand < HammerCLIForeman::Command
    resource :inventory
    command_name 'rh_cloud_report'

    class DownloadCommand < HammerCLIForeman::DownloadCommand
      command_name 'download'
      desc 'Download the last generated report'

      action :download_file

      failure_message _('Failed to download report')

      build_options
    end

    class GenerateCommand < HammerCLIForeman::Command
      command_name 'generate'
      action :generate_report
      desc 'Start new report generation'

      success_message _('Report generation started successfully')
      failure_message _('Failed to start report generation task, please check server logs for more information.')

      build_options
    end

    autoload_subcommands
  end
end
