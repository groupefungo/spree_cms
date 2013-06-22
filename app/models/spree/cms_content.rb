module Spree
  class CmsContent < ActiveRecord::Base
    translates :text
    belongs_to :cms_section

    attr_accessible :text, :cms_section_id, :date_available, :seq, :expiration_date

    validates_presence_of :text
    validates_presence_of :date_available, if: Proc.new {|s| s.expiration_date}

    validate :expiration_date_valid?, if: Proc.new {|s| s.expiration_date && s.date_available}

    def self.find_active_for_section(section_code)
      contents = []

      section = (CmsSection.where(code: section_code, app_code: ENV['APP_CODE'])||[])[0]
      contents = section.cms_contents.where("date_available is not null").order('seq asc') if section
      if contents
        contents = contents.select {|c| c.active? }
      end
      return contents
    end

    def active?
      !self.expiration_date || (self.date_available <= Date.today && Date.today <= self.expiration_date )
    end

    def text_html
      self.text.html_safe if self.text
    end

    def expiration_date_valid?
      if self.expiration_date <= self.date_available
        self.errors.add(:expiration_date, I18n.t('invalid_date_expiration'))
      end
    end
  end
end
