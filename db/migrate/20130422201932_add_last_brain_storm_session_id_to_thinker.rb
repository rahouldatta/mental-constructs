class AddLastBrainStormSessionIdToThinker < ActiveRecord::Migration
  def change
    add_column :thinkers, :last_brain_storm_session_id, :integer
  end
end
