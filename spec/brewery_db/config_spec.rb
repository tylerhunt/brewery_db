require 'spec_helper'

describe BreweryDB::Config do
  specify do
    described_class::ENDPOINT.should == 'http://api.brewerydb.com/v2'
  end

  its(:endpoint) { should == described_class::ENDPOINT }

  context '#endpoint=' do
    specify do
      expect {
        subject.endpoint = 'http://api.playground.brewerydb.com'
      }.to change(subject, :endpoint).to('http://api.playground.brewerydb.com')
    end
  end

  context '#api_key=' do
    specify do
      expect {
        subject.api_key = 'A1029384756B'
      }.to change(subject, :api_key).to('A1029384756B')
    end
  end
end
