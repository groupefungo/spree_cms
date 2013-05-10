module CmsContentHelper

  def create_cms_content(section_id, title, text=nil, date_avail=Time.now)
    image = fixture_file_upload("#{::Rails.root}/spec/fixtures/cms_content_test.png", 'image/png')
    Spree::CmsContent.create!({
                                  cms_section_id: section_id,
                                  text: text,
                                  title: title,
                                  date_available: date_avail,
                                  image: image
                              })
  end

  def create_cms_content_in_new_section(section_code, content_title, content_text=nil)
    create_cms_sections(section_code)
    section = fetch_cms_section(section_code)
    create_cms_content(section.id, content_title, content_text)
    section.id
  end

  def fetch_cms_section(code)
    Spree::CmsSection.find_by_code(code)
  end

  def create_cms_sections(*codes)
    codes.each { |c| Spree::CmsSection.find_or_create_by_code(c) }
  end

  def fetch_contents_to_display_for_section(section_code)
    Spree::CmsContent.find_active_for_section(section_code)
  end

end