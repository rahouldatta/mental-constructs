class AddThinkerIdToBrainStormSessions < ActiveRecord::Migration
  def change
    add_column :brain_storm_sessions, :thinker_id, :integer
  end
end
