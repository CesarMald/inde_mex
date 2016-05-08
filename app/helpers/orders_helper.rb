module OrdersHelper

  def order_status_combo
    [
      ["En progreso", "in_progress"],
      ["Completadas", "completed"]
    ]
  end
end
