module Spree
  class CmsContent < ActiveRecord::Base
    translates :title, :text
    belongs_to :cms_section

    attr_accessible :title, :text, :cms_section_id, :image, :date_available, :seq
    validate :validate_field_base

    has_attached_file :image,
                      :styles => {:small => '100x100>', :normal => '221x221>', :slider => '970x404>'},
                      :default_style => :page,
                      :url => '/spree/contenus/:id/:style/:basename.:extension',
                      :path => ':rails_root/public/spree/contenus/:id/:style/:basename.:extension',
                      :convert_options => {:all => '-strip -auto-orient'}

    def self.find_active_for_section(section_code)
      section = CmsSection.find_by_code(section_code)
      return section.cms_contents.where("date_available is not null").order('seq asc') if section
      return []
    end

    def validate_field_base
      if [:title, :text, :image_file_name].all? { |f| self.send(f).blank? }
        self.errors[:base] << "You must enter either 'Title', 'Text' or 'Image'."
      end
    end

    def text_html
      self.text.html_safe if self.text
    end
  end
end
