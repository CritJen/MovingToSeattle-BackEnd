class AddNeighboorhoodAndIdToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :neighborhood, :string
    add_column :properties, :link_id, :integer
  end
end
