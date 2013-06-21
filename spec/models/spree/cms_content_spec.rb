require "spec_helper"

describe Spree::CmsContent do
  it "valid field base" do
    expect(Spree::CmsContent.new).to have(1).errors_on(:text)
  end

  it "valid - text not blank" do
    expect(Spree::CmsContent.new(text: 'patate')).to have(:no).errors_on(:text)
  end

  it '#find_active_for_section - happy path' do
    section = Spree::CmsSection.create!(code: 's1', app_code: ENV['APP_CODE'])
    Spree::CmsContent.create!(text: 'patate', cms_section_id: section.id, date_available: Time.now)
    Spree::CmsContent.create!(text: 'patate2', cms_section_id: section.id, date_available: Time.now)

    section2 = Spree::CmsSection.create!(code: 's2', app_code: 'app_code2')
    Spree::CmsContent.create!(text: 'patate', cms_section_id: section2.id, date_available: Time.now)

    expect(Spree::CmsContent.find_active_for_section('s1').count).to eq(2)
  end

  it '#find_active_for_section - section does not exist' do
    section = Spree::CmsSection.create!(code: 's1', app_code: ENV['APP_CODE'])
    Spree::CmsContent.create!(text: 'patate', cms_section_id: section.id, date_available: Time.now)
    Spree::CmsContent.create!(text: 'patate2', cms_section_id: section.id, date_available: Time.now)

    section2 = Spree::CmsSection.create!(code: 's2', app_code: 'app_code2')
    Spree::CmsContent.create!(text: 'patate', cms_section_id: section2.id, date_available: Time.now)
    expect(Spree::CmsContent.find_active_for_section('s3').count).to eq(0)
  end
end
