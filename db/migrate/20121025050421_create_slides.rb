class CreateSlides < ActiveRecord::Migration
  def self.up
    create_table :slides do |t|
      t.string :name
      t.string :link
      t.timestamps
    end
  end

  def self.down
    drop_table :slides
  end
end