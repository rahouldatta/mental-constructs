class CreateBrainStormSessions < ActiveRecord::Migration
  def change
    create_table :brain_storm_sessions do |t|
      t.integer :construct_id

      t.timestamps
    end
  end
end
