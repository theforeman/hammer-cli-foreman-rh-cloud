require File.join(File.dirname(__FILE__), '../../test_helper')

describe 'insights inventory download-report' do
  before do
    @cmd = %w[insights inventory download-report]
  end

  it 'fails on missing organization-id' do
    api_expects_no_call
    params = ['--path', '/tmp']
    result = run_cmd(@cmd + params)
    expected_error = 'please set one of options --organization-id, --organization, --organization-title'
    assert_equal(result.exit_code, HammerCLI::EX_SOFTWARE)
    assert_match(/#{expected_error}/, result.err)
  end

  it 'fails if required path param is missing' do
    api_expects_no_call
    params = ['--organization-id', '2']
    result = run_cmd(@cmd + params)
    expected_error = 'Option \'--path\' is required'
    assert_equal(result.exit_code, HammerCLI::EX_USAGE)
    assert_match(/#{expected_error}/, result.err)
  end

  it 'succeeds on sync with organization-id' do
    api_expects(:inventory, :download_file).with_params('organization_id' => 2)
    params = ['--organization-id', '2', '--path', '/tmp']
    run_cmd(@cmd + params)
  end
end
