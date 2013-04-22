class AddSessionTitleToBrainStormSessions < ActiveRecord::Migration
  def change
    add_column :brain_storm_sessions, :session_title, :string
  end
end
