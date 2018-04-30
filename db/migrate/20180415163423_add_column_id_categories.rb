class AddColumnIdCategories < ActiveRecord::Migration[5.1]
  def change
      add_column :article_categories, :category_id, :integer
  end
end
