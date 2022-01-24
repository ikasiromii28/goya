class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :kibun, null: false
      t.date :date, null: false
      t.string :option
      t.timestamps
    end
  end
end
