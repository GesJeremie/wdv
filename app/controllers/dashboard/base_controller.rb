class Dashboard::BaseController < ApplicationController
  http_basic_authenticate_with name: Option.first.admin_name, password: Option.first.admin_password

  layout 'dashboard'
end
