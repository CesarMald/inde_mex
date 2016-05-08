class CreateInteriorBuilders < ActiveRecord::Migration
  def change
    create_table :interior_builders do |t|
      t.string :title
      t.string :description
      t.string :hover_title
      t.string :hover_description
      t.string :url_link
      t.string :position

      t.timestamps null: false
    end
  end
end
