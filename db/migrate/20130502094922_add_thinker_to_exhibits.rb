class AddThinkerToExhibits < ActiveRecord::Migration
  def change
    add_column :exhibits, :thinker, :string
  end
end
