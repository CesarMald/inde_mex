class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.string :description
      t.string :text_link
      t.string :url_link

      t.timestamps null: false
    end
  end
end
