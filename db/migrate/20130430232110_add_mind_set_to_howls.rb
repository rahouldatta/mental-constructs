class AddMindSetToHowls < ActiveRecord::Migration
  def change
    add_column :howls, :mind_set, :string
  end
end
