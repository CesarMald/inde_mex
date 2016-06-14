class AddStatusToModel < ActiveRecord::Migration
  def change
    add_column :models, :active, :boolean, default: true
  end
end
