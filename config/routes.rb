Rails.application.routes.draw do
  devise_for :users
  root to: redirect('api/v1/users')
end
