module CmsContentHelper

  def create_cms_content(content)
    Spree::CmsContent.create!({
                                  cms_section_id: content.cms_section_id,
                                  text: content.text,
                                  date_available: content.date_avail||10.days.ago,
                                  expiration_date: content.expiration_date||10.days.from_now,
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

  def fetch_cms_section(section)
    (Spree::CmsSection.where(code: section.code, app_code: section.app_code)||[])[0]
  end

  def create_cms_sections(*sections)
    sections.each { |s| Spree::CmsSection.find_or_create_by_code(code: s.code, app_code: s.app_code) }
  end

  def fetch_contents_to_display_for_section(section_code)
    Spree::CmsContent.find_active_for_section(section_code)
  end

end