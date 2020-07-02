class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content
      t.string :image_id
      t.integer :category_id
      t.integer :pr_release_id
      t.integer :pr_company_id
      t.timestamps
    end
  end
end
