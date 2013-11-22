class AddTitleToCmsContentTranslations < ActiveRecord::Migration
  class AddTitleToCmsContent < ActiveRecord::Migration
    def change
      add_column :spree_cms_content_translations, :title, :string
    end
  end
end
