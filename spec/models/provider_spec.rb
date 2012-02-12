require 'spec_helper'

describe Provider do
  it 'provider has 2 providers' do
    Provider.all.count.should == 2
  end
  
  describe 'providers' do
    it { Provider.facebook.should be_present }
    it { Provider.twitter.should be_present }
  end
end
