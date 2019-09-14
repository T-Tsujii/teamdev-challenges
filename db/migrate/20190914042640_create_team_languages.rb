class CreateTeamLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :team_languages do |t|
      t.string :team_id, null: false
      t.string :name, null: false

      t.index :name

      t.timestamps
    end
  end
end
