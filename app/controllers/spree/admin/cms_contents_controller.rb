#encoding=utf-8
module Spree
  module Admin
    class CmsContentsController < CmsApplicationController
      before_filter :load_data

      private

      def location_after_save
        admin_cms_section_contents_url(@page)
      end

      def load_data
        @page = CmsContent.find(params[:page_id])
      end
    end
  end
end
