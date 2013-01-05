module Twenty3AndMe
end

require 'httparty'
require 'grape'

require_relative 'twenty3andme/client'
require_relative 'twenty3andme/callback_listener'
require_relative 'twenty3andme/engine' if defined?(Rails)
