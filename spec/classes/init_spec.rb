require 'spec_helper'
describe 'metadata' do

  context 'with defaults for all parameters' do
    it { should contain_class('metadata') }
  end
end
