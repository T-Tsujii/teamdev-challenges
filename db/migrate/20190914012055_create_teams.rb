class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :user_id,                    null: false
      t.string  :name,                       null: false
      t.text    :content
      t.boolean :recruitment, default: true, null: false

      t.index :name, unique: true

      t.timestamps
    end
  end
end
