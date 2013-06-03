require "spec_helper"

describe Spree::CmsContent do
  it "valid field base" do
    expect(Spree::CmsContent.new).to have(1).errors_on(:text)
  end

  it "valid - text not blank" do
    expect(Spree::CmsContent.new(text: 'patate')).to have(:no).errors_on(:text)
  end
end
