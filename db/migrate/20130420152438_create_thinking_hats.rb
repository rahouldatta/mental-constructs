class CreateThinkingHats < ActiveRecord::Migration
  def change
    create_table :thinking_hats do |t|
      t.integer :construct_id
      t.text :white_hat
      t.text :red_hat
      t.text :black_hat
      t.text :yellow_hat
      t.text :green_hat
      t.text :collective

      t.timestamps
    end
  end
end
