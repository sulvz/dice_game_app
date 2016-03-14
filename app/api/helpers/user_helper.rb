module UserHelper
  def current_user
    @current_user ||= User.authenticate!(headers['X-Dice-Game-Auth-Token'])
  end

  def authenticate!
    error!('401 Unauthorized', 401) unless current_user
  end
end
