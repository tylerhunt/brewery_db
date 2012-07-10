require 'spec_helper'

describe BreweryDB::Config do
  {
    BASE_URI: 'http://api.brewerydb.com/v2',
    USER_AGENT: "BreweryDB Ruby Gem #{BreweryDB::VERSION}"
  }.each do |constant, value|
    context constant do
      subject { described_class.const_get(constant) }

      it { should == value }
    end
  end

  subject { Class.new { include BreweryDB::Config }.new }

  context 'defaults' do
    its(:api_key) { should be_nil }
  end

  context '#api_key=' do
    specify do
      expect {
        subject.api_key = 'A1029384756B'
      }.to change(subject, :api_key).to('A1029384756B')
    end
  end
end
