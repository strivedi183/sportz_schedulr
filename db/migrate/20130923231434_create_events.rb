class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string        :name
      t.string        :description
      t.float         :lat
      t.float         :lng
      t.datetime      :date
      t.timestamps
    end
  end
end
