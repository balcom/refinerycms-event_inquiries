page_position = (Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)

reservations_page = Page.create({
  :title => "Reservations",
  :link_url => "/reservations",
  :menu_match => "^/(event_inquiries|reservations).*$",
  :deletable => false,
  :position => (page_position += 1)
})
reservations_page.parts.create({
  :title => "Body",
  :body => "<p>Get in touch with us. Just use the form below and we'll get back to you as soon as we can.</p>",
  :position => 0
})
reservations_page.parts.create({
  :title => "Side Body",
  :body => "<p>163 Evergreen Terrace<br/>Happyville<br/>USA.<br/>Phone: 1-800 CALLUSNOW</p>",
  :position => 1
})