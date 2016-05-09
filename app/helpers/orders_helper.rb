module OrdersHelper

  def order_status_combo
    [
      ["En progreso", "in_progress"],
      ["Completadas", "completed"]
    ]
  end

  def order_status status
    if status == "in_progress"
      "En Progreso"
    else
      "Completada"
    end
  end
end
