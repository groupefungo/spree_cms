$(document).ready(function () {
    CKEDITOR.replace('cms_content_text');

    var multi_lang_dropdown = $('#spree_multi_lingual_dropdown');
    var default_lang = $(multi_lang_dropdown).val();

    $(multi_lang_dropdown).change(function () {

        var lang = $(this).val();
        var el_id_lang_suffix = '';
        if (lang != default_lang) {
            el_id_lang_suffix = '_' + lang;
        }

        $("[id^='cke_cms_content_text']").hide();
        replace_textarea_by_ckeditor('cms_content_text' + el_id_lang_suffix);
        $("textarea[id^='cms_content_text']").hide();

    });

    function replace_textarea_by_ckeditor(id) {
        try
        {
            CKEDITOR.replace(id);
        }
        catch(err)
        {
            if (err.indexOf('is already attached to the provided element') == -1) {
                throw err;
            } else {
                $('#cke_'+id).show();
            }
        }

    }
});