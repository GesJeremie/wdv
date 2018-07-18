class BaseController < ApplicationController
  layout :current_layout

  before_action :set_current_user

  def set_current_user
    return unless current_user.nil?

    user = User.create
    cart = Cart.create(user: user)

    session[:current_user_id] = user.id
  end

  def current_layout
    if request.xhr?
      false
    else
      'app'
    end
  end
end
