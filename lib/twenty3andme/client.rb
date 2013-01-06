module Twenty3AndMe
  class Client
    include HTTParty
    base_uri 'api.23andme.com'
    VERSION = '/1'
    
    attr_accessor :token    
    attr_accessor :refresh_token    
    
    def get(path)
      options = { :headers => {"Authorization" => "Bearer #{@token}"} }
      fullpath = URI.escape(VERSION + path)
      self.class.get(fullpath, options).parsed_response
    end
    
    def request_token(client_id, client_secret, code, redirect_uri, scope)
      scope_uri = Array(scope).join(" ")
      req_body = {:client_id => client_id, :client_secret => client_secret, :grant_type => 'authorization_code', :code => code, :redirect_uri => redirect_uri, :scope => scope_uri}
      resp = self.class.post("https://api.23andme.com:443/token", :body => req_body)
      
      @token = resp['access_token']
      @refresh_token = resp['refresh_token']
    end
    
    #TODO
    def request_refresh_token()
    end
    
    ### Requests
    
    def user
      get('/user')
    end
    
    def names
      get('/names')
    end

    def haplogroups
      get('/haplogroups')
    end
    
    def genotypes(locations)
      locations_uri = Array(locations).join(" ")
      get("/genotypes/?locations=#{locations_uri}")
    end
    
    def ancestry(threshold)
      get("/ancestry/?threshold=#{threshold.to_f}")
    end
    
    def relatives
      get("/relatives")
    end
    
    def genomes(profile_id)
      get("/genomes/#{profile_id}")
    end
    
  end
end
