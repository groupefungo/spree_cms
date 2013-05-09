# This migration comes from spree_cms (originally 20130506174445)
class CreateCmsSection < ActiveRecord::Migration
  def up
    create_table :spree_cms_sections do |t|
      t.string :code

      t.timestamps
    end
  end

  def down
    drop_table :spree_cms_sections
  end
end
