class API < Grape::API

  helpers UserHelper
  helpers ParamsHelper

  prefix 'api'
  version 'v1', using: :path
  format :json

  default_format :json
  default_error_status 400

  mount V1::Users

  add_swagger_documentation api_version: 'v1',
                            hide_format: true,
                            hide_documentation_path: true
end
