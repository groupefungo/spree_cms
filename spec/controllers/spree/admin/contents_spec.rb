require "#{File.dirname(__FILE__)}/../../controllers_spec_helper"

describe Spree::Admin::CmsContentsController do
  it "#index" do
    spree_get :index
  end
end