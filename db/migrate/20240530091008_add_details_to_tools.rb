class AddDetailsToTools < ActiveRecord::Migration[7.1]
  def change
    add_column :tools, :latitude, :float
    add_column :tools, :longitude, :float
    add_column :tools, :condition, :string
    add_column :tools, :rating, :integer
    add_column :tools, :brand, :string
  end
end
