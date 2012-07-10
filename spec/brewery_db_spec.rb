require 'spec_helper'

describe BreweryDB do
  [
    Relax::Client.instance_methods(false),
    BreweryDB::Client.instance_methods(false)
  ].flatten.each do |method|
    it "responds to .#{method}" do
      described_class.should respond_to(method)
    end

    it "delegates .#{method} to .client" do
      described_class.send(:client).should_receive(method)
      described_class.send(method)
    end
  end
end
