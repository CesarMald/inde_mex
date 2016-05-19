class CreateNewsletterBuilders < ActiveRecord::Migration
  def change
    create_table :newsletter_builders do |t|
      t.string :title
      t.string :description
      t.string :text_link

      t.timestamps null: false
    end
  end
end
