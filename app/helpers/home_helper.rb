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
end
