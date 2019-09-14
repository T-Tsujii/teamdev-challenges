class CreateTeamParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :team_participants do |t|
      t.integer :team_id, null: false
      t.integer :user_id, null: false

      t.index [:team_id, :user_id], unique: true

      t.timestamps
    end
  end
end
