module V1
  class Users < Grape::API

    resource :users do
      get do
        User.all
      end
    end

    add_swagger_documentation(hide_format: true, api_version: 'v1')
  end
end
