require 'spec_helper'

describe BreweryDB do
  subject { described_class }

  its(:client) { should be_a(BreweryDB::Client) }

  context 'delegation' do
    BreweryDB::Client.instance_methods(false).sort.each do |method|
      it "delegates ##{method} to #client" do
        described_class.client.should_receive(method)
        described_class.send(method)
      end
    end
  end
end
