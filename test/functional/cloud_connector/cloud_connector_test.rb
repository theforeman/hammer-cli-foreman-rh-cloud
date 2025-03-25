require File.join(File.dirname(__FILE__), '../../test_helper')

describe 'insights inventory cloud-connector enable' do
  include ForemanTaskHelpers
  before do
    @cmd = %w[insights cloud-connector enable]
  end
  let(:task_id) { '5' }
  let(:response) do
    {
      'id' => task_id,
      'state' => 'planned',
    }
  end

  it 'succeeds on sync with organization-id' do
    api_expects(:inventory, :enable_cloud_connector).returns(response)
    result = run_cmd(@cmd)
    assert_match(/Cloud connector enable task started/, result.out)
  end
end
