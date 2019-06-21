class ChangeNameColumnToEnumInCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :name, :string
    add_column :categories, :name, :integer, default: 0
  end
end
