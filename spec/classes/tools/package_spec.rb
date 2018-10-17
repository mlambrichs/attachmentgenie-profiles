require 'spec_helper'
describe 'profiles::tools::package' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      context 'with defaults for all parameters' do
        it { is_expected.to contain_class('profiles::tools::package') }
        it { is_expected.to contain_package('fpm') }
      end
    end
  end
end
