class AddAppCodeToSection < ActiveRecord::Migration
  def up
    add_column :spree_cms_sections, :app_code, :string
  end

  def down
    remove_column :spree_cms_sections, :app_code
  end
end
