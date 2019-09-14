class CreateMySites < ActiveRecord::Migration[5.2]
  def change
    create_table :my_sites do |t|
      t.integer :user_id, null: false
      t.string  :name,    null: false
      t.string  :url,     null: false

      t.timestamps
    end
  end
end
