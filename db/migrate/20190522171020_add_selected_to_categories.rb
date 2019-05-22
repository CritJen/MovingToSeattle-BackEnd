class AddSelectedToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :selected, :boolean
    add_column :categories, :weight, :integer
  end
end
