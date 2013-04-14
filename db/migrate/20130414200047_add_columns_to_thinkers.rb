class AddColumnsToThinkers < ActiveRecord::Migration
  def change
    add_column :thinkers, :alias, :string
    add_column :thinkers, :first_name, :string
    add_column :thinkers, :last_name, :string
    add_column :thinkers, :age, :integer
    add_column :thinkers, :gender, :string
  end
end
