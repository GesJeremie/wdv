class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :title
      t.string :description
      t.string :short_description
      t.float :unit_price_in_cents
      t.integer :in_stock
      t.string :gif
      t.string :icon
      t.jsonb :metadata
      t.boolean :active

      t.timestamps
    end
  end
end
