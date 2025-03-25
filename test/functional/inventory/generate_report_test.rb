require File.join(File.dirname(__FILE__), '../../test_helper')

describe 'insights inventory generate-report' do
  include ForemanTaskHelpers
  before do
    @cmd = %w[insights inventory generate-report]
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
    api_expects(:inventory, :generate_report).with_params('organization_id' => 2).returns(response)
    params = ['--organization-id', '2']
    result = run_cmd(@cmd + params)
    assert_match(/Report generation started successfully/, result.out)
  end

  it 'succeeds on sync with no-upload' do
    api_expects(:inventory, :generate_report).with_params('organization_id' => 2, 'no_upload' => true).returns(response)
    params = ['--organization-id', '2', '--no-upload']
    result = run_cmd(@cmd + params)
    assert_match(/Report generation started successfully/, result.out)
  end
end
