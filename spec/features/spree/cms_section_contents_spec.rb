require 'spec_helper'

feature 'Cms section contents' do

  scenario 'listing' do
    content1 = OpenStruct.new(text: 'some text 1', seq: 3)
    content2 = OpenStruct.new(text: 'test text', seq: 1)

    navigate_admin_cms_section_contents('test', content1, content2)

    expect(page).to have_css('#listing_cms_section_cms_contents')

    db_contents = Spree::CmsSection.where(code: 'test')[0].cms_contents
    db_contents.each do |c|
      within "#listing_cms_section_cms_contents #spree_cms_content_#{c.id}" do
#        expect(page).to have_css('.content_title', text: c.title)

        expect(page).to have_css('.content_text', text: c.text)

        expect(page).to have_css('.content_date_available', text: c.date_available.to_s)

=begin
        if (!c.image_file_name)
          expect(page).to have_no_css(".content_image img")
        else
          expect(page).to have_css(".content_image img[src='/spree/contenus/#{c.id}/small/#{c.image_file_name}']")
        end
=end

        expect(page).to have_css('.content_seq', text: c.seq.to_s)
      end
    end

    seqs = all(:css, '.content_seq')
    seqs[0].text.should == '1'
    seqs[1].text.should == '3'
  end

  scenario 'add' do
    navigate_admin_cms_section_contents('test')

    click_link('admin_new_cms_section_cms_content_link')

    expect(page).to have_css('form#new_cms_content')
    fill_in('cms_content_text', with: 'test')

    Spree::CmsContent.all.count.should == 0
    click_button('Create')
    Spree::CmsContent.all.count.should == 1
  end

  scenario 'edit' do
    content1 = OpenStruct.new(text: 'some text 1')
    content2 = OpenStruct.new(text: 'some text 2')

    navigate_admin_cms_section_contents('test', content1, content2)
    find('a[data-action="edit"]').click

    expect(page).to have_css('form#edit_cms_content_1')
#    expect(page).to have_css('#cms_content_title')
    expect(page).to have_css('#cms_content_date_available')
#    expect(page).to have_css('#cms_content_image')
    expect(page).to have_css('#cms_content_text')
    expect(page).to have_css('#cms_content_seq')
  end
end