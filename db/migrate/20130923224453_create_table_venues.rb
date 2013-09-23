class CreateTableVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string        :name
      t.text          :description
      t.float         :lat
      t.float         :lng
      t.timestamps
    end
  end
end
