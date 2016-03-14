module V1
  class Users < Grape::API

    resource :users do
      get '/' do
        authenticate!
        { msg: 'ok' }
      end

      desc 'Registrate User'
      params do
        requires :email, type: String, desc: 'Your email.'
        requires :password, type: String, desc: 'Your password.'
      end
      post '/registration'do
        user = User.create!(params)
        user.auth_token
      end

      desc 'Delete User'
      params do
        requires :email, type: String, desc: 'Your email.'
        requires :auth_token, type: String, desc: 'AuthToken.'
      end
      post '/' do
        user = User.create!(params)
        user.auth_token
      end

    end
  end
end
