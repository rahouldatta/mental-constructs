class CreateFlashes < ActiveRecord::Migration
  def change
    create_table :flashes do |t|
      t.integer :brain_storm_session_id
      t.text :flash
      t.text :sub_points

      t.timestamps
    end
  end
end
