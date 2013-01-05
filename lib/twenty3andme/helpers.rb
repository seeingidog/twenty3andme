module Twenty3AndMe
  module Helpers
    #lollongname
    #TODO: use intitializer to load this in parent app
    def url_for_23andme_authorize(redirect_uri, client_id, scope)
      scope_uri = Array(scope).join("%20")
      return "https://api.23andme.com/authorize/?redirect_uri=#{redirect_uri}&response_type=code&client_id=#{client_id}&scope=#{scope_uri}"
    end
  end
end
