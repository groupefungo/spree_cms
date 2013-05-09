require "#{File.dirname(__FILE__)}/../../controllers_spec_helper"

describe Spree::Admin::CmsSectionsController do
  it "#index" do
    spree_get :index
  end
end