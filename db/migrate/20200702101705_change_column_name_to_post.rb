class ChangeColumnNameToPost < ActiveRecord::Migration[5.2]
  def up
    remove_column :posts, :pr_release_id
    remove_column :posts, :pr_company_id
    add_column :posts, :company_id, :integer
    add_column :posts, :release_id, :integer
  end
  def down
    add_column :posts, :pr_release_id, :integer
    add_column :posts, :pr_company_id, :integer
    remove_column :posts, :company_id
    remove_column :posts, :release_id
  end
end
