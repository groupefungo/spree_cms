module CmsContentHelper

  def create_cms_content(content)
    set_image = true if content.set_image.nil?
    image = nil
    if set_image
      image = fixture_file_upload("#{::Rails.root}/spec/fixtures/cms_content_test.png", 'image/png')
    end

    Spree::CmsContent.create!({
                                  cms_section_id: content.cms_section_id,
                                  text: content.text,
                                  title: content.title,
                                  date_available: content.date_avail||Time.now,
                                  image: image,
                                  seq: content.seq
                              })
  end

  def create_cms_content_in_new_section(section_code, content)
    create_cms_sections(section_code)
    section = fetch_cms_section(section_code)
    content.cms_section_id = section.id
    create_cms_content(content)
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