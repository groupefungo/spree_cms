require "spec_helper"

describe Spree::CmsContent do
  it "valid field base - all blank" do
    subject.valid?
    subject.errors[:base].should == ["You must enter either 'Title', 'Text' or 'Image'."]
  end

  it "valid field base - title not blank" do
    subject.title = 'patate'
    subject.valid?
    subject.errors[:base].should_not include("You must enter either 'Title', 'Text' or 'Image'.")
  end

  it "valid field base - content not blank" do
    subject.text = 'patate'
    subject.valid?
    subject.errors[:base].should_not include("You must enter either 'Title', 'Text' or 'Image'.")
  end

  it "valid field base - photo not blank" do
    subject.image_file_name = 'patate'
    subject.valid?
    subject.errors[:base].should_not include("You must enter either 'Title', 'Text' or 'Image'.")
  end
end
