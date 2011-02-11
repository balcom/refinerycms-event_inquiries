class EventInquiryMailer < ActionMailer::Base

  def confirmation(event_inquiry, request)
    subject     EventInquirySetting.confirmation_subject
    recipients  event_inquiry.email
    from        "\"#{RefinerySetting[:site_name]}\" <no-reply@#{request.domain(RefinerySetting.find_or_set(:tld_length, 1))}>"
    reply_to    EventInquirySetting.notification_recipients.split(',').first
    sent_on     Time.now
    @event_inquiry =  event_inquiry
  end

  def notification(event_inquiry, request)
    subject     EventInquirySetting.notification_subject
    recipients  EventInquirySetting.notification_recipients
    from        "\"#{RefinerySetting[:site_name]}\" <no-reply@#{request.domain(RefinerySetting.find_or_set(:tld_length, 1))}>"
    sent_on     Time.now
    @event_inquiry =  event_inquiry
  end

end
