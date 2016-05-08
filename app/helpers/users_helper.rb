module UsersHelper

  def role_combo
    [["Administrador", "admin"], ["Mayorista", "regular"], ["Mayorista Premium", "premium"]]
  end

  def role_to_s role
    roles = {
      "admin" => "Administrador",
      "regular" => "Mayorista",
      "premium" => "Mayorista Premium"
    }
    roles[role]
  end

  def hear_about_us_options
    [
      ["Facebook", "facebook"],
      ["Google", "Google"],
      ["Mercado Libre", "mercado_libre"],
      ["Amazon", "amazon"],
      ["Linio", "linio"]
    ]
  end

  def status_to_s user_status
    possible_status = {
      "active" => "Activo",
      "inactive" => "Inactivo"
    }
    possible_status[user_status]
  end

  def status_combo
    [
      ["Activo", "active"],
      ["Inactivo", "inactive"]
    ]
  end

  def users_combo
    User.all.map{ |u| [u.complete_name, u.id] }
  end

end
