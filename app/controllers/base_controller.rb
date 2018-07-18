class BaseController < ApplicationController
  layout :current_layout

  def current_layout
    if request.xhr?
      false
    else
      'app'
    end
  end
end
