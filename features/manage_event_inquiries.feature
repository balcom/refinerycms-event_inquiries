@refinerycms @event_inquiries @event_inquiries-manage
Feature: Manage EventInquiries
  In order to see event_inquiries left for me on my website
  As an Administrator
  I want to manage event_inquiries

  Background:
    Given I am a logged in refinery user
    And I have no event_inquiries
    And I have an event_inquiry from "David Jones" with email "dave@refinerycms.com" and message "Hello, I really like your website.  Was it hard to build and maintain or could anyone do it?"

  Scenario: EventInquiries List
    When I go to the list of event_inquiries
    Then I should see "David Jones said Hello, I really like your website. Was it hard to build ..."
    And I should have 1 event_inquiries
    And I should not see "Add"

  Scenario: Spam List
    When I go to the list of event_inquiries
    And I follow "Spam"
    Then I should see "Hooray! You don't have any spam."

  @event_inquiry-settings
  Scenario: Updating who gets notified
    When I go to the list of event_inquiries
    And I follow "Update who gets notified"
    And I fill in "Send notifications to" with "phil@refinerycms.com"
    And I press "Save"
    Then I should be redirected back to "the list of event_inquiries"
    And I should see "'Notification Recipients' was successfully updated."
    And I should be on the list of event_inquiries

  @event_inquiry-settings
  Scenario: Updating confirmation email copy
    When I go to the list of event_inquiries
    And I follow "Edit confirmation email"
    And I fill in "Message" with "Thanks %name%! We'll never get back to you!"
    And I press "Save"
    Then I should be redirected back to "the list of event_inquiries"
    And I should see "'Confirmation Body' was successfully updated."
    And I should be on the list of event_inquiries

  Scenario: EventInquiries Show
    When I go to the list of event_inquiries
    And I follow "Read the event_inquiry"
    Then I should see "From David Jones [dave@refinerycms.com]"
    And I should see "Hello, I really like your website. Was it hard to build and maintain or could anyone do it?"
    And I should see "Age"
    And I should see "Back to all EventInquiries"
    And I should see "Remove this event_inquiry forever"

  Scenario: EventInquiries Delete
    When I go to the list of event_inquiries
    And I follow "Read the event_inquiry"
    And I follow "Remove this event_inquiry forever"
    Then I should see "'David Jones' was successfully removed."
    And I should have 0 event_inquiries
