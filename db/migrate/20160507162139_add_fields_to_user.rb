class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :cell_phone, :string
    add_column :users, :company, :string
    add_column :users, :hear_about_us, :string
    add_column :users, :subscribed_to_newsletter, :boolean, default: false
    add_column :users, :status, :string, default: "inactive"
  end
end
