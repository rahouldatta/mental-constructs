class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.integer :thinker_id
      t.string :title
      t.text :construct
      t.text :brain_storm
      t.integer :popularity_quotient
      t.text :foot_notes

      t.timestamps
    end
  end
end
