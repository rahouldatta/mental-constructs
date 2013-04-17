class AddDescriptionToLinkHoards < ActiveRecord::Migration
  def change
    add_column :link_hoards, :description, :text
  end
end
