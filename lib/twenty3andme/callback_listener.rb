module Twenty3AndMe
  class CallbackListener < Grape::API

      resources do
        get do
          code = params.code
          client = Client.new
          client.request_token(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], code, ENV['REDIRECT_URI'], ENV['SCOPE'].split(','))
          
          handler = Twenty3AndMe::CallbackHandler.new
          handler.handle(client.token, client.refresh_token)
          
          status 302
          header 'Location', ENV['AFTER_REDIRECT_URI']
        end
      end

  end
end
