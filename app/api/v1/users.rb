module V1
  class Users < Grape::API

    resource :users do
      get do
        #authorize!
        User.all
      end

      desc 'User registration'
      params do
        requires :email, type: String, desc: 'Your email.'
        requires :password, type: String, desc: 'Your password.'
      end
      post do
        user = User.create!(params)
        user.auth_token
      end
    end
  end
end
