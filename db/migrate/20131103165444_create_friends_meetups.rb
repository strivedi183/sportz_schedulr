class CreateFriendsMeetups < ActiveRecord::Migration
  def change
    create_table :friends_meetups do |t|
      t.integer   :friend_id
      t.integer   :meetup_id
    end
  end
end
