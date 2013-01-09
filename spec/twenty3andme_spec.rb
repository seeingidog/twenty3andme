require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Twenty3andme" do
  
  context "API Client" do
    
    before :all do
      code = "fillmein"
      @client = Twenty3AndMe::Client.new
      @client.request_token(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], code, ENV['REDIRECT_URI'], ENV['SCOPE'].split(','))
    end
    
    it "has a token recieved by 23andme" do
      @client.token.should_not be_nil
    end
    
    it "makes the /user request " do
      @client.user
    end
    
    it "makes the /names request " do
      @client.names
    end
    
    it "makes the /haplogroups request " do
      @client.haplogroups
    end
    
    it "makes the /relatives request " do
      @client.relatives
    end
    
    it "requests a genotype" do
      @client.genotype('rs3094315')
    end
    
    
  end
  
end


