module SpreeCmsSpecHelper

  def navigate_admin_cms_section_contents(section, *contents)
    create_cms_sections(section)

    if contents
      db_section = fetch_cms_section(section)
      contents.each do |c|
        c.cms_section_id = db_section.id
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

  def navigate_admin_cms(*sections)
    create_cms_sections(*sections)
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
