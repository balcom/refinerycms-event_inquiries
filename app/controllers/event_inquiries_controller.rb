class EventInquiriesController < ApplicationController

  before_filter :find_page, :only => [:create, :new]

  def thank_you
    @page = Page.find_by_link_url("/contact/thank_you", :include => [:parts, :slugs])
  end

  def new
    @event_enquiry = EventInquiry.new
  end

  def create
    @event_enquiry = EventInquiry.new(params[:event_enquiry])

    if @event_enquiry.save
      if @event_enquiry.ham?
        begin
          EventInquiryMailer.notification(@event_enquiry, request).deliver
        rescue
          logger.warn "There was an error delivering an event_enquiry notification.\n#{$!}\n"
        end

        begin
          EventInquiryMailer.confirmation(@event_enquiry, request).deliver
        rescue
          logger.warn "There was an error delivering an event_enquiry confirmation:\n#{$!}\n"
        end
      end

      redirect_to thank_you_event_inquiries_url
    else
      render :action => 'new'
    end
  end

protected

  def find_page
    @page = Page.find_by_link_url('/contact', :include => [:parts, :slugs])
  end

end
