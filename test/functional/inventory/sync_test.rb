require File.join(File.dirname(__FILE__), '../../test_helper')

describe 'insights inventory sync' do
  include ForemanTaskHelpers
  before do
    @cmd = %w[insights inventory sync]
  end
  let(:task_id) { '5' }
  let(:response) do
    {
      'id' => task_id,
      'state' => 'planned',
    }
  end

  it 'fails on missing organization-id' do
    api_expects_no_call
    result = run_cmd(@cmd)
    expected_error = 'please set one of options --organization-id, --organization, --organization-title'
    assert_equal(result.exit_code, HammerCLI::EX_SOFTWARE)
    assert_match(/#{expected_error}/, result.err)
  end

  it 'succeeds on sync with organization-id' do
    api_expects(:inventory, :sync_inventory_status).with_params('organization_id' => 2).returns(response)
    params = ['--organization-id', '2']
    result = run_cmd(@cmd + params)
    assert_match(/Inventory sync task started successfully/, result.out)
    assert_match(/Task id: 5/, result.out)
  end
end
