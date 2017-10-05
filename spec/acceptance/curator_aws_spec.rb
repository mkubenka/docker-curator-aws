require 'spec_helper'

describe 'curator_aws' do
  describe command('/usr/bin/curator --help') do
    its(:exit_status) { should eq 0 }
  end
end
