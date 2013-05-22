require 'spec_helper'

feature 'Cms section contents' do

  scenario 'listing' do
    content1 = OpenStruct.new(title: 'test title1', text: 'some text 1')
    content2 = OpenStruct.new(title: 'test title2', text: 'some text 2')

    navigate_admin_cms_section_contents('test', content1, content2)

    expect(page).to have_css('#listing_cms_section_cms_contents')

    Spree::CmsSection.where(code: 'test')[0].cms_contents.each do |c|
      within "#listing_cms_section_cms_contents #spree_cms_content_#{c.id}" do
        expect(page).to have_css('.content_title', text: c.title)
        expect(page).to have_css('.content_text', text: c.text)
      end
    end
  end

  scenario 'add' do
    navigate_admin_cms_section_contents('test')

    click_link('admin_new_cms_section_cms_content_link')

    expect(page).to have_css('form#new_cms_content')
    fill_in('cms_content_title', with: 'test title')

    Spree::CmsContent.all.count.should == 0
    click_button('Create')
    Spree::CmsContent.all.count.should == 1
  end

  scenario 'edit' do
    content1 = OpenStruct.new(title: 'test title1', text: 'some text 1')
    content2 = OpenStruct.new(title: 'test title2', text: 'some text 2')

    navigate_admin_cms_section_contents('test', content1, content2)
    find('a[data-action="edit"]').click

    expect(page).to have_css('form#edit_cms_content_1')
  end
end