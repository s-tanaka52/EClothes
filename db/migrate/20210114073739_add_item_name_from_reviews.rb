class AddItemNameFromReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :item_name, :string
    add_column :reviews, :brand_name, :string
  end
end
