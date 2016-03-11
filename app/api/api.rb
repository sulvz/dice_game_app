class API < Grape::API
  prefix 'api'
  version 'v1', using: :path
  format :json

  default_format :json
  default_error_status 400

  mount V1::Users

end
