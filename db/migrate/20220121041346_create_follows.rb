class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :followed_id
      t.integer :following_id
      t.timestamps
    end
    add_index :follows, :followed_id
    add_index :follows, :following_id
    add_index :follows, [:followed_id, :following_id], unique: true
  end
end
