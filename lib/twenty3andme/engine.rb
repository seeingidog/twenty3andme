module Twenty3AndMe
  class Engine < Rails::Engine
    paths['config'] << 'config'
  end
end
