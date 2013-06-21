module Spree
  module Admin
    class CmsSectionsController < CmsApplicationController
      def collection
        col = super
        col.where(app_code: ENV['APP_CODE'])
      end
    end
  end
end
