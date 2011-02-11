class CreateEventInquiries < ActiveRecord::Migration
  def self.up
    unless ::EventInquiry.table_exists?
      create_table ::EventInquiry.table_name, :force => true do |t|
        t.string   "name"
        t.string   "email"
        t.string   "phone"
        t.text     "message"
        t.integer  "position"
        t.boolean  "open",       :default => true
        t.datetime "created_at"
        t.datetime "updated_at"
        t.boolean  "spam",       :default => false
      end

      add_index ::EventInquiry.table_name, :id
    end

    # todo: remove at 1.0
    create_table ::EventInquirySetting.table_name, :force => true do |t|
      t.string   "name"
      t.text     "value"
      t.boolean  "destroyable"
      t.datetime "created_at"
      t.datetime "updated_at"
    end unless ::EventInquirySetting.table_exists?

    load(Rails.root.join('db', 'seeds', 'pages_for_event_inquiries.rb').to_s)
  end

  def self.down
     drop_table ::EventInquiry.table_name
     # todo: remove at 1.0
     drop_table ::EventInquirySetting.table_name
     Page.delete_all({:link_url => ("/contact" || "/contact/thank_you")})
  end
end