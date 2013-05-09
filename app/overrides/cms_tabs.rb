Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "cms_admin_tabs",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text => "<%= tab(:cms, :url => admin_cms_sections_path, :icon => 'icon-cms') %>",
                     :disabled => false,
                     :original => '25010f5b9a3bf3f6558c39ab04b40edc8c190538' )
