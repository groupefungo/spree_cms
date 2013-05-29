class CreateCmsContent < ActiveRecord::Migration
  def up
    create_table :spree_cms_contents do |t|
      t.integer :cms_section_id
      t.string :title
      t.text :text
      t.date :date_available
      t.integer :seq

      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.timestamp :image_updated_at

      t.timestamps
    end
  end

  def down
    drop_table :spree_cms_contents
  end
end
