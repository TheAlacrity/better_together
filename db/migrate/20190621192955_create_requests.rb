class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :status
      t.integer :requester_id
      t.integer :requestee_id

      t.timestamps
    end
  end
end
