class AddTypeOfCognitionToExhibits < ActiveRecord::Migration
  def change
    add_column :exhibits, :type_of_cognition, :string
  end
end
