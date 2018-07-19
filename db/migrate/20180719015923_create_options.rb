class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.boolean :open, default: false
      t.string :phone
      t.string :admin_name
      t.string :admin_password
    end
  end
end
