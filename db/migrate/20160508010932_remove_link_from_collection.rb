class RemoveLinkFromCollection < ActiveRecord::Migration
  def change
    remove_column :collections, :url_link
  end
end
