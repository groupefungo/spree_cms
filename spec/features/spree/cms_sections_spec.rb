require 'spec_helper'

feature 'Sections' do
  scenario 'listing', js: true do

    login_admin

    create_cms_sections('test', 'test2')

    visit spree.admin_path
    click_link('Cms')

    expect(page).to have_css('#listing_cms_sections')

    sections = Spree::CmsSection.all
    sections.each do |s|
      within '#listing_cms_sections' do
        expect(page).to have_css("#spree_cms_section_#{s.id}", text: "#{s.code}")
      end
    end
  end
end