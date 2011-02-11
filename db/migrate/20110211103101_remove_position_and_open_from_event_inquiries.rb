class RemovePositionAndOpenFromEventInquiries < ActiveRecord::Migration
  def self.up
    remove_column :event_inquiries, :position
    remove_column :event_inquiries, :open
  end

  def self.down
    add_column :event_inquiries, :position, :integer
    add_column :event_inquiries, :open,     :boolean, :default => true
  end
end
