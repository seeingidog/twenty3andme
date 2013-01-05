module Twenty3AndMe
  module Helpers
    def url_for_23andme_authorize
      return "https://api.23andme.com/authorize/?redirect_uri=#{ENV['REDIRECT_URI']}&response_type=code&client_id=#{ENV['CLIENT_ID']}&scope=#{ENV['SCOPE'].split(',').join("%20")}"
    end
  end
end
