class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :title
      t.string :description
      t.string :link_url
      t.string :link_text
      t.string :banner_type, default: "complete"
      t.string :hover_title
      t.string :hover_description
      t.string :position

      t.timestamps null: false
    end
  end
end
