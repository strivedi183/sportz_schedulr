class CreateMeetupsTable < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string      :title
      t.datetime    :start_date
      t.datetime    :end_date
      t.integer     :user_id
      t.integer     :event_id
      t.integer     :venue_id
      t.timestamps
    end
  end
end
