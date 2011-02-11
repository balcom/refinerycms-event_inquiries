class Admin::EventInquiriesController < Admin::BaseController

  crudify :event_inquiry, :title_attribute => "name", :order => "created_at DESC"
  helper_method :group_by_date

  before_filter :find_all_ham, :only => [:index]
  before_filter :find_all_spam, :only => [:spam]
  before_filter :get_spam_count, :only => [:index, :spam]

  def index
    @event_inquiries = @event_inquiries.with_query(params[:search]) if searching?
    @event_inquiries = @event_inquiries.paginate({:page => params[:page]})
  end

  def spam
    self.index
    render :action => 'index'
  end

  def toggle_spam
    find_event_inquiry
    @event_inquiry.toggle!(:spam)

    redirect_to :back
  end

protected

  def find_all_ham
    @event_inquiries = EventInquiry.ham
  end

  def find_all_spam
    @event_inquiries = EventInquiry.spam
  end

  def get_spam_count
    @spam_count = EventInquiry.count(:conditions => {:spam => true})
  end

end
