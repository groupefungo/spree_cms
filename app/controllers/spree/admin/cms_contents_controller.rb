#encoding=utf-8
module Spree
  module Admin
    class CmsContentsController < CmsApplicationController
      belongs_to 'spree/cms_section', find_by: :id

      protected

      def collection
        super.sort! {|a,b| (a.seq||-1) <=> (b.seq||-1)}
      end
    end
  end
end
