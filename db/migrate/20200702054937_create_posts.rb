class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content
      t.string :image_id
      t.integer :pr_release_id, null: false
      t.integer :pr_company_id, null: false
      t.timestamps
    end
  end
end
