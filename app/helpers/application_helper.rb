module ApplicationHelper

  def current_controller
    params[:controller]
  end

  def set_active_class action_link
    controllers = { 
        order: ["orders"], 
        product: ["products"],
        user: ["users"],
        collection: ["collections"],
        model: ["models"],
        brand: ["brands"],
        home: ["sliders"],
        builder: ["interior_builders"]
    }
    controllers[:home].concat(["banners", "slider_brands"])
    controllers[action_link.to_sym].include?(current_controller) ? "active" : ""
  end
end
