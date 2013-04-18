class CreateDossiers < ActiveRecord::Migration
  def change
    create_table :dossiers do |t|
      t.integer :thinker_id
      t.string :type
      t.string :dossier_name
      t.integer :dossier_quality

      t.timestamps
    end
  end
end
