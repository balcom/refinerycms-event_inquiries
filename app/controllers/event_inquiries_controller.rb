class EventInquiriesController < ApplicationController

  before_filter :find_page, :only => [:create, :new]

  def thank_you
    @page = Page.find_by_link_url("/contact/thank_you", :include => [:parts, :slugs])
  end

  def new
    @event_inquiry = EventInquiry.new
  end

  def create
    @event_inquiry = EventInquiry.new(params[:event_inquiry])

    if @event_inquiry.save
      if @event_inquiry.ham?
        begin
          EventInquiryMailer.notification(@event_inquiry, request).deliver
        rescue
          logger.warn "There was an error delivering an event_inquiry notification.\n#{$!}\n"
        end

        begin
          EventInquiryMailer.confirmation(@event_inquiry, request).deliver
        rescue
          logger.warn "There was an error delivering an event_inquiry confirmation:\n#{$!}\n"
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
