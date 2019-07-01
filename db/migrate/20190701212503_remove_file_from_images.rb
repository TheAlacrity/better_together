class RemoveFileFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :file, :binary
  end
end
