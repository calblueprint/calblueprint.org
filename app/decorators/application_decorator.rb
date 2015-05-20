class ApplicationDecorator < Draper::Decorator
  def yes_no(pred)
    pred ? "Yes" : "No"
  end
end
