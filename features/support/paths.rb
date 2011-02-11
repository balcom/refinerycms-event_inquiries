module NavigationHelpers
  module Refinery
    module EventInquiries
      def path_to(page_name)
        case page_name
        when /the contact page/
          new_event_enquiry_path

        when /the contact thank you page/
          thank_you_event_inquiries_path

        when /the contact create page/
          event_inquiries_path

        when /the list of event_inquiries/
          admin_event_inquiries_path

        when /the list of spam event_inquiries/
          spam_admin_event_inquiries_path
        else
          nil
        end
      end
    end
  end
end