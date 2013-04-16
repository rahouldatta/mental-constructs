class CreateLinkHoards < ActiveRecord::Migration
  def change
    create_table :link_hoards do |t|
      t.integer :thinker_id
      t.text :link
      t.string :category

      t.timestamps
    end
  end
end
