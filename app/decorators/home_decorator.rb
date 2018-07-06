class HomeDecorator < Draper::Decorator
  delegate_all

  def todo?
  end
end
