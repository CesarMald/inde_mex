class AddSeenToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :seen, :boolean, default: false
  end
end
