require 'spec_helper'

describe 'curator_aws' do
  describe command('/usr/bin/curator --version') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /curator, version/ }
  end
end
