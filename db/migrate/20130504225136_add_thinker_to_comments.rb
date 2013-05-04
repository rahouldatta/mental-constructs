class AddThinkerToComments < ActiveRecord::Migration
  def change
    add_column :comments, :thinker, :string
  end
end
