module Spree
  module Admin
    class CmsSectionsController < CmsApplicationController

      private

      def location_after_save
        admin_cms_sections_url
      end
    end
  end
end
