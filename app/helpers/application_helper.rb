module ApplicationHelper
  def number_to_pound(price)
    number_to_currency(price, :unit => "£")
  end
end
