require 'serverspec'

set :backend, :exec

describe 'ark::default' do
  describe command('redis-cli ping') do
    its(:stdout) { should match(/PONG/) }
  end
end
