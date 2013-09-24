class MeetupsUsers < ActiveRecord::Migration
  def change
    create_table :meetups_users do |t|
      t.integer     :meetup_id
      t.integer     :user_id
    end
  end
end
