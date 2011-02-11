# EventInquiries

![Refinery EventInquiries](http://refinerycms.com/system/images/0000/0626/event_inquiries.png)

### Gem Installation using Bundler (The very best way)

Include the latest [gem](http://rubygems.org/gems/refinerycms-event_inquiries) into your Refinery CMS application's Gemfile:

    gem 'refinerycms-event_inquiries', '~> 0.9.9.9'

Then type the following at command line inside your Refinery CMS application's root directory:

    bundle install

You don't currently have to do any migrations because Refinery CMS never removed the event_inquiries tables by default.
This will change in a future version - follow the instructions below if you are running the currently unreleased Refinery 0.9.9.

#### Installation on Refinery 0.9.9

The event_inquiries table has been removed from the base install of Refinery 0.9.9.  To install the migrations, run:

    rails generate refinerycms_event_inquiries

Next migrate your database and you're done:

    rake db:migrate

## About

__Add a simple contact form to Refinery that notifies you and the customer when an event_inquiry is made.__

In summary you can:

* Collect and manage event_inquiries
* Specify who is notified when a new event_inquiry comes in
* Customise an auto responder email that is sent to the person making the event_inquiry

When event_inquiries come in, you and the customer are notified. The event_inquiry will now show up as an "open" event_inquiry. The idea is to deal with the event_inquiry and then "close" it so you know it's been sorted.

## How do I get Notified?

Go into your 'EventInquiries' tab in the Refinery admin area and click on "Update who gets notified"

## How do I Edit the Automatic Confirmation Email

Go into your 'EventInquiries' tab in the Refinery admin area and click on "Edit confirmation email"