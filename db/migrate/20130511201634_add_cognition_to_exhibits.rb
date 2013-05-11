class AddCognitionToExhibits < ActiveRecord::Migration
  def change
    add_column :exhibits, :cognition, :text
  end
end
