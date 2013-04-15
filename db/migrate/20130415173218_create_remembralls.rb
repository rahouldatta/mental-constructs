class CreateRemembralls < ActiveRecord::Migration
  def change
    create_table :remembralls do |t|
      t.integer :thinker_id
      t.text :task

      t.timestamps
    end
  end
end
