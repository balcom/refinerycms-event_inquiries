Given /^I have no event_inquiries$/ do
  EventInquiry.delete_all
end

Then /^I should have ([0-9]+) event_inquiries?$/ do |count|
  EventInquiry.count.should == count.to_i
end

Given /^I have an? event_enquiry from "([^"]*)" with email "([^\"]*)" and message "([^\"]*)"$/ do |name, email, message|
  EventInquiry.create(:name => name,
                 :email => email,
                 :message => message)
end

Given /^I have an? event_enquiry titled "([^"]*)"$/ do |title|
  EventInquiry.create(:name => title,
                 :email => 'test@cukes.com',
                 :message => 'cuking ...',
                 :spam => false)

  EventInquiry.create(:name => title,
                 :email => 'test@cukes.com',
                 :message => 'cuking ...',
                 :spam => true)
end
