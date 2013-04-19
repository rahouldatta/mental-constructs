class CreateConstructs < ActiveRecord::Migration
  def change
    create_table :constructs do |t|
      t.integer :thinker_id
      t.integer :dossier_id
      t.string :title
      t.text :construct
      t.text :foot_notes
      t.integer :affinity_level
      t.boolean :share

      t.timestamps
    end
  end
end
