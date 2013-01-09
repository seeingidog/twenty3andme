require 'spec_helper'

describe Twenty3AndMe::CallbackListener do
  include Rack::Test::Methods

  def app
    Twenty3AndMe::CallbackListener
  end
  
  before do
  end


  describe "GET /?code=adc996063679f1a400aa0e13c54094dc" do
    it "returns the provided code from 23andme" do
      get "/?code=adc996063679f1a400aa0e13c54094dc"
      last_response.status.should == 200
    end
  end
end
