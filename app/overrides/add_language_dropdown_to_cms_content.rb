Deface::Override.new(
    :virtual_path => "spree/admin/cms_contents/_form",
    :insert_top   => "[data-hook='admin_cms_content_form_top']",
    :text         => '<%= render "spree/admin/shared/language_dropdown", :object => @cms_content -%>',
    :name         => "add_language_dropdown_to_cms_content"
)