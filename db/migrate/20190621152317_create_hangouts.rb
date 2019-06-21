class CreateHangouts < ActiveRecord::Migration[5.2]
  def change
    create_table :hangouts do |t|
      t.string :name
      t.string :address
      t.integer :category_id

      t.timestamps
    end
  end
end
