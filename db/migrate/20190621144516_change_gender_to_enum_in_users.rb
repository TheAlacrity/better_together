class ChangeGenderToEnumInUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :gender, :string
    add_column :users, :gender, :integer, default: 0
  end
end
