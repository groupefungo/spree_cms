require 'spec_helper'

feature 'Sections' do
  scenario 'listing' do

    navigate_admin_cms('test', 'test2')

    expect(page).to have_css('#listing_cms_sections')

    sections = Spree::CmsSection.all
    sections.each do |s|
      within '#listing_cms_sections' do
        expect(page).to have_css("#spree_cms_section_#{s.id}", text: "#{s.code}")
      end
    end
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
    navigate_admin_cms_section_edit('test')

    expect(page).to have_css('ul[data-hook="admin_cms_section_tabs"]')
    find('#cms_section_code').value.should ==  'test'
  end
end