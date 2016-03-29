module V1
  class Users < Grape::API

    resource :users do
      get '/' do
        #authenticate!
        #{"current_score": current_user.score}
        User.all
      end

      desc 'Registrate User'
      params do
        requires :email, type: String, desc: 'Your email.'
        requires :password, type: String, desc: 'Your password.'
      end
      post '/registration' do
        user = User.create!(params)
        {'X-Dice-Game-Auth-Token': user.auth_token}
      end

      desc 'Delete User'
      params do
        requires :email, type: String, desc: 'Your email.'
        requires :password, type: String, desc: 'Your password.'
      end
      delete '/' do
        user = User.find_by_email(params[:email])
        if user && user.password = params.password
          user.destroy!
        else
          error!({ status: :error, message: :user_not_found }, 404)
        end
      end

      desc 'Update User Score'
      params do
        requires :score, type: Integer, desc: 'User_score'
      end
      put '/' do
        authenticate!
        current_user.score = params.score
        current_user.save!
        {"current_score": current_user.score}
      end

    end
  end
end
