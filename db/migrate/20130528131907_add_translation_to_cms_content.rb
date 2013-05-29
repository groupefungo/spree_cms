class AddTranslationToCmsContent < ActiveRecord::Migration
  def up
    Spree::CmsContent.create_translation_table! :title => :string, :text => :text
  end
  def down
    Spree::CmsContent.drop_translation_table!
  end
end
