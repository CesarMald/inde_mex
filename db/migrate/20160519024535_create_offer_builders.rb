class CreateOfferBuilders < ActiveRecord::Migration
  def change
    create_table :offer_builders do |t|

      t.timestamps null: false
    end
  end
end
