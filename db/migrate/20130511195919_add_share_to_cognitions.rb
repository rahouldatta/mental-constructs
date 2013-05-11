class AddShareToCognitions < ActiveRecord::Migration
  def change
    add_column :cognitions, :share, :boolean
  end
end
