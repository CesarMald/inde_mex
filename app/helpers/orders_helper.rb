module OrdersHelper

  def order_status_combo
    [
      ["Borrador", "draft"],
      ["En progreso", "in_progress"],
      ["Completadas", "completed"]
    ]
  end

  def order_status status
    case status
    when "draft" then "Borrador"
    when "in_progress" then "En Progreso"
    when "completed" then "Completada"
    end
  end
end
