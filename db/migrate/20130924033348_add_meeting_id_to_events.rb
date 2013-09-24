class AddMeetingIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :meetup_id, :integer
  end
end
