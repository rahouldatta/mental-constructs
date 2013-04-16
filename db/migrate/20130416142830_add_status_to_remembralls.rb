class AddStatusToRemembralls < ActiveRecord::Migration
  def change
    add_column :remembralls, :status, :boolean
  end
end
