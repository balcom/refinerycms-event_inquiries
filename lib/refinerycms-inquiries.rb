require File.expand_path('../event_inquiries', __FILE__)

module Refinery
  module EventInquiries
    class Engine < Rails::Engine
      config.to_prepare do
        require 'filters_spam'
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinery_event_inquiries"
          plugin.directory = "event_inquiries"
          plugin.menu_match = /(refinery|admin)\/inquir(ies|y_settings)$/
          plugin.activity = {
            :class => EventInquirySetting,
            :title => 'name'
          }
        end
      end
    end
  end
end