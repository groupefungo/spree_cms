module Spree
  class CmsSection < ActiveRecord::Base
    attr_accessible :code, :app_code
    validates_presence_of :code, :app_code

    has_many :cms_contents, :dependent => :destroy
  end
end
