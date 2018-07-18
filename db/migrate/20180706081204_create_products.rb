class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :short_description
      t.string :description
      t.float :unit_price
      t.string :icon
      t.jsonb :metadata
      t.boolean :active

      t.timestamps
    end
  end
end
