module Twenty3AndMe
  class CallbackListener < Grape::API

      resources do
        get do
          @code = params.code
          c = Client.new
          c.request_token(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], @code, ENV['REDIRECT_URI'], ENV['SCOPE'])
        end
      end

  end
end
