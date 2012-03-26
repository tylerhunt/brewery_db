require 'spec_helper'

describe BreweryDB do
  subject { described_class }

  its(:client) { should be_a(BreweryDB::Client) }

  BreweryDB::Client.instance_methods(false).sort.each do |method|
    context "##{method}" do
      it 'responds to method' do
        described_class.should respond_to(method)
      end

      it 'delegates to #client' do
        described_class.client.should_receive(method)
        described_class.send(method)
      end
    end
  end
end
