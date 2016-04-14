class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :title
      t.string :url_link
      t.string :description
      t.string :link_text

      t.timestamps null: false
    end
  end
end
