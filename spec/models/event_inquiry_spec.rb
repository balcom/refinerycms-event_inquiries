require 'spec_helper'

Dir[File.expand_path('../../../features/support/factories.rb', __FILE__)].each {|f| require f}

describe EventInquiry do
  describe "validations" do
    before(:each) do
      @attr = {
        :name => "rspec",
        :email => "rspec@refinery.com",
        :message => "test"
      }
    end

    it "rejects empty name" do
      EventInquiry.new(@attr.merge(:name => "")).should_not be_valid
    end

    it "rejects empty message" do
      EventInquiry.new(@attr.merge(:message => "")).should_not be_valid
    end

    it "rejects invalid email format" do
      ["", "@refinerycms.com", "refinery@cms", "refinery@cms.123"].each do |email|
        EventInquiry.new(@attr.merge(:email => email)).should_not be_valid
      end
    end
  end

  describe "default scope" do
    it "orders by created_at in desc" do
      event_inquiry1 = Factory(:event_inquiry, :created_at => 1.hour.ago)
      event_inquiry2 = Factory(:event_inquiry, :created_at => 2.hours.ago)
      event_inquiries = EventInquiry.all
      event_inquiries.first.should == event_inquiry1
      event_inquiries.second.should == event_inquiry2
    end
  end

  describe ".latest" do
    it "returns latest 7 non-spam event_inquiries by default" do
      8.times { Factory(:event_inquiry) }
      EventInquiry.last.toggle!(:spam)
      EventInquiry.latest.length.should == 7
    end

    it "returns latest 7 event_inquiries including spam ones" do
      4.times { Factory(:event_inquiry) }
      3.times { Factory(:event_inquiry) }
      EventInquiry.all[0..2].each { |event_inquiry| event_inquiry.toggle!(:spam) }
      EventInquiry.latest(7, true).length.should == 7
    end

    it "returns latest n event_inquiries" do
      4.times { Factory(:event_inquiry) }
      EventInquiry.latest(3).length.should == 3
    end
  end
end
