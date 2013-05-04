class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :thinker_id
      t.integer :exhibit_id
      t.string :exhibit_title
      t.string :exhibit_thinker
      t.string :brain_storm_title

      t.timestamps
    end
  end
end
