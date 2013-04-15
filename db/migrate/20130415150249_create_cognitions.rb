class CreateCognitions < ActiveRecord::Migration
  def change
    create_table :cognitions do |t|
      t.integer :thinker_id
      t.string :type
      t.text :cognition

      t.timestamps
    end
  end
end
