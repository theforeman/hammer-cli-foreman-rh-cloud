require 'hammer_cli_foreman/ping'

module HammerCLIForemanRhCloud
  module CommandExtensions
    class Ping < HammerCLI::CommandExtensions
      before_print do |data|
        unless data.dig('results', 'foreman_rh_cloud').nil?
          data.dig('results', 'foreman_rh_cloud', 'services')&.each do |_, service_hash|
            service_hash['_response'] = format_response(service_hash)
          end
        end
      end

      def self.format_response(service_hash)
        if service_hash['duration_ms']
          _('Duration: %sms') % service_hash['duration_ms']
        elsif service_hash['message']
          _('Message: %s') % service_hash['message']
        end
      end

      output do |definition|
        definition.append do
          from 'foreman_rh_cloud' do
            from :services do
              label 'advisor', hide_blank: true do
                from 'advisor' do
                  field 'status', _('Status')
                  field '_response', _('Server Response')
                end
              end
              label 'vulnerability', hide_blank: true do
                from 'vulnerability' do
                  field 'status', _('Status')
                  field '_response', _('Server Response')
                end
              end
            end
          end
        end
      end
    end

    HammerCLIForeman::PingCommand::ForemanCommand.extend_with(
      HammerCLIForemanRhCloud::CommandExtensions::Ping.new
    )
  end
end
