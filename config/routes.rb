Rails.application.routes.draw do
  mount Twenty3AndMe::CallbackListener    => '/callback_listener'
end
