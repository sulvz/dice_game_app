class API < Grape::API

  helpers UserHelper
  helpers ParamsHelper

  prefix 'api'
  version 'v1', using: :path
  format :json
  formatter :json, Grape::Formatter::Rabl

  default_format :json
  default_error_status 400

  mount V1::Users

  # SwaggerUI http://localhost:3000/api/swagger
  # SwaggerUI path http://localhost:3000/api/v1/swagger_doc
  add_swagger_documentation api_version: 'v1',
                            hide_format: true,
                            hide_documentation_path: true
end
