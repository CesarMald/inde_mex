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
      ["facebook", "Facebook"],
      ["google", "Google"],
      ["mercado_libre", "Mercado Libre"],
      ["amazon", "Amazon"],
      ["linio", "Linio"]

    ]
  end
end
