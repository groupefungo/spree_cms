class AddExpirationDateToCmsContent < ActiveRecord::Migration
  def up
    add_column :spree_cms_contents, :expiration_date, :date
  end
  def down
    remove_column :spree_cms_contents, :expiration_date
  end
end
