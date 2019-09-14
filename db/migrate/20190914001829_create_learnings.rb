class CreateLearnings < ActiveRecord::Migration[5.2]
  def change
    create_table :learnings do |t|
      t.integer :user_id, null: false
      t.string  :type,    null: false
      t.string  :name,    null: false
      t.integer :comprehension

      t.timestamps
    end
  end
end
