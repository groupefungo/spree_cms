module CmsContentHelper

  def create_cms_content(section_id, title, text, date_avail=Time.now)
    Spree::CmsContent.create!({
                                  section_id: section_id,
                                  text: text,
                                  title: title,
                                  date_available: date_avail
                              })
  end

  def create_cms_content_in_new_section(section_code, content_title, content_text)
    create_cms_sections(section_code)
    section = fetch_cms_section(section_code)
    create_cms_content(section.id, content_title, content_text)
    section.id
  end

  def fetch_cms_section(code)
    Spree::CmsSection.find_by_code(code)
  end

  def create_cms_sections(*codes)
    codes.each { |c| Spree::CmsSection.create!(code: c) }
  end

  def login_admin
    email = 'test@test.com'
    password = 'test2000'

    user = Spree::User.new(login: email, email: email, password: password, password_confirmation: password)
    user.spree_roles << Spree::Role.find_or_create_by_name('admin')
    user.save!

    visit spree.login_path
    fill_in 'spree_user_email', with: email
    fill_in 'spree_user_password', with: password
    click_button('Login')
  end

  def fetch_contents_to_display_for_section(section_code)
    Spree::CmsContent.find_active_for_section(section_code)
  end

end