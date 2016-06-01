module HomeHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def products_order_combo
    [["Highest Price", "highest"], ["Lowest Price", "lowest"]]
  end

  def span_label type
    type == "newest" ? "Nuevo" : "Sale"
  end

  def label_class type
    type == "newest" ? "label" : "label deal-label"
  end

  def image_style picture_path
    if Rails.env.development?
      server_name = ""
    else
      server_name = "http://159.203.192.36/"
    end

    "background: url('" + server_name + picture_path + "') no-repeat center center fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;"
  end

  def offer_style picture_path

  end
end
