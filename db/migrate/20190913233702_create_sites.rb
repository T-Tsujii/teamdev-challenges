class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.integer :user_id, null: false
      t.string  :name,    null: false
      t.string  :url,     null: false

      t.timestamps
    end
  end
end