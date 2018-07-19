class Dashboard::OptionsController < Dashboard::BaseController
  before_action :set_options, only: [:edit, :update]

  def edit
  end

  def update
    @option.update(option_params)
    render :edit
  end

  private

    def set_options
      @option = Option.first
    end

    def option_params
      params.require(:option).permit(:open, :phone, :admin_name, :admin_password)
    end
end
