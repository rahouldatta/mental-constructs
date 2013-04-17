class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.integer :thinker_id
      t.integer :dossier_id
      t.string :title
      t.text :concept
      t.integer :affinity_level
      t.text :foot_notes
      t.boolean :share

      t.timestamps
    end
  end
end
