module Twenty3AndMe
  class Engine < Rails::Engine
    paths['config'] << 'config'
    
    initializer 'twenty3andme.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper Twenty3AndMe::Helpers
      end
    end
    
  end
end
