class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :feedback
      t.integer :thinker_id
      t.string :type_of_feedback

      t.timestamps
    end
  end
end
