class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :email
      t.string :password_digest
      t.text :about
      t.integer :age
      t.string :gender
      t.integer :looking_for_gender
      t.integer :looking_for_role

      t.timestamps
    end
  end
end
