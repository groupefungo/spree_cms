module Spree
  class CmsSection < ActiveRecord::Base
    attr_accessible :code
    validates_presence_of :code

    has_many :cms_contents, :dependent => :destroy
  end

end
