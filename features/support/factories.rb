require 'factory_girl'

Factory.define :event_enquiry do |i|
  i.name "Refinery"
  i.email "refinery@cms.com"
  i.message "Hello..."
end
