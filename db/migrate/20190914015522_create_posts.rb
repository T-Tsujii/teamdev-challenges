class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :team_id, null: false
      t.integer :user_id, null: false
      t.text    :content, null: false

      t.timestamps
    end
  end
end
