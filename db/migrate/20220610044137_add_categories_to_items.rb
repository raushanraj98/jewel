class AddCategoriesToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :category_id, :int
  end
end
