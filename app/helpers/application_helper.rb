module ApplicationHelper
  def number_to_pound(price)
    number_to_currency(price, :unit => "£")
  end

  def avatar_url(user)
    # gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    if user.image
      user.image
    else
      "http://gurucul.com/wp-content/uploads/2015/01/default-user-icon-profile.png"
    end
  end
end
