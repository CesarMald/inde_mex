module ApplicationHelper

  def current_controller
    params[:controller]
  end

  def set_active_class action_link
    current_controller == action_link ? "active" : ""
  end
end
