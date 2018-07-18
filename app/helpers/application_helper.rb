module ApplicationHelper
  include ActionView::Helpers::NumberHelper

  def store_open?
    true
  end

  def humanize_boolean(boolean)
    boolean ? 'Yes' : 'No'
  end

  def dot_boolean(boolean)
    if boolean
      '<span class="dot dot--true icon icon--circle"></span>'
    else
      '<span class="dot dot--false icon icon--circle"></span>'
    end
  end

  def dashboard_flash_class(type)
    case type.to_sym
      when :notice  then 'alert alert-info'
      when :success then 'alert alert-success'
      when :error   then 'alert alert-error'
      when :alert   then 'alert alert-error'
    end
  end

  def list_gifs
    list_filenames('app/assets/images/gifs/*')
  end

  def list_icons
    list_filenames('app/assets/images/icons/*')
  end

  def price_humanize(price)
    if is_round_number(price)
      number_to_currency(price, precision: 0)
    else
      number_to_currency(price, precision: 2)
    end
  end

  def is_round_number(number)
    number % 1 == 0
  end

  private

    def list_filenames(path)
      Dir.glob(path).map { |file| file.split('/').last }
    end
end
