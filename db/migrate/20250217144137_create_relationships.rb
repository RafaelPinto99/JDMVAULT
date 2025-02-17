class CreateRelationships < ActiveRecord::Migration[7.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps
    end
   add_foreign_key :relationships, :users, column: :follower_id
   add_foreign_key :relationships, :users, column: :following_id
  end
end
