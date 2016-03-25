Rails.application.routes.draw do
  devise_for :users
  mount API => "/"
  mount_ember_app :frontend, to: "/"
end
