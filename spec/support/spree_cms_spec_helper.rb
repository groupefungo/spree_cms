module SpreeCmsSpecHelper

  def navigate_admin_cms_section_contents(section_code, *contents)
    create_cms_sections(section_code)

    if contents
      section = fetch_cms_section(section_code)
      contents.each do |c|
        c.cms_section_id = section.id
        create_cms_content(c)
      end
    end

    navigate_admin
    click_link('Cms')
    find('a[data-action="edit"]').click
    click_link('Contents')
  end

  def navigate_admin_cms_section_edit(*section_code)
    navigate_admin_cms(*section_code)
    find('a[data-action="edit"]').click
  end

  def navigate_admin_cms(*section_codes)
    create_cms_sections(*section_codes)
    navigate_admin
    click_link('Cms')
  end

  def navigate_admin
    login_admin
    visit spree.admin_path
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
end
