module Twenty3AndMe
  class CallbackListener < Grape::API

      resources do
        get do
          @code = params.code
          c = Client.new
          c.request_token(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], @code, ENV['REDIRECT_URI'], ENV['SCOPE'].split(','))
          Twenty3AndMe::CallbackHandler.handle(c.token, c.refresh_token)
        end
      end

  end
end
