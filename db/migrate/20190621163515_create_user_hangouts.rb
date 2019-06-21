class CreateUserHangouts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_hangouts do |t|
      t.integer :user_id
      t.integer :hangout_id

      t.timestamps
    end
  end
end
