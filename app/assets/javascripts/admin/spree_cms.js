//= require admin/spree_core
//= require ckeditor/init

$(function() {
    $( document ).tooltip({
        items: '.cms_content_trigger',
        content: function() {
            return $(this).parent().find('.cms_content').html();
        }
    });
})