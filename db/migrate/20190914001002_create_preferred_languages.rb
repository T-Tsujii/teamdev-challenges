class CreatePreferredLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :preferred_languages do |t|
      t.integer :user_id, null: false
      t.string  :name,    null: false

      t.index :name

      t.timestamps
    end
  end
end
