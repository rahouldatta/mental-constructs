class AddAffinityLevelToCognitions < ActiveRecord::Migration
  def change
    add_column :cognitions, :affinity_level, :integer
  end
end
