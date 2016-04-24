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
end
