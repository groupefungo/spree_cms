require 'spec_helper'

feature 'Sections' do
  scenario 'listing' do

    section = OpenStruct.new(code: 'test', app_code: 'test')
    section2 = OpenStruct.new(code: 'test2', app_code: 'test')
    section3 = OpenStruct.new(code: 'test3', app_code: 'app_test3')
    navigate_admin_cms(section, section2, section3)

    expect(page).to have_css('#listing_cms_sections')

    sections = Spree::CmsSection.where(app_code: 'app_test')
    sections.each do |s|
      within '#listing_cms_sections' do
        expect(page).to have_css("#spree_cms_section_#{s.id}", text: "#{s.code}")
      end
    end

    expect(page).not_to have_content('test3')
  end

  scenario 'add success' do

    navigate_admin_cms

    click_link('admin_new_section_link')

    Spree::CmsSection.all.count.should == 0

    fill_in('cms_section_code', with: 'test')
    click_button('Create')

    Spree::CmsSection.all.count.should == 1
    Spree::CmsSection.first.code.should == 'test'
  end

  scenario 'add error' do

    navigate_admin_cms

    click_link('admin_new_section_link')
    click_button('Create')

    Spree::CmsSection.all.count.should == 0

    section = Spree::CmsSection.new
    section.valid?
    expect(page).to have_css('#errorExplanation', text: section.errors[:code][0])
  end

  scenario 'edit' do
    section = OpenStruct.new(code: 'test', app_code: 'test')
    navigate_admin_cms_section_edit(section)

    expect(page).to have_css('ul[data-hook="admin_cms_section_tabs"]')
    find('#cms_section_code').value.should ==  'test'
  end
end