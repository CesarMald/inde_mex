class AddStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string, default: "in_progress"
  end
end
