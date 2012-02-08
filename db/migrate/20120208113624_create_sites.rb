class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :url
      t.text :description
      t.string :creator
      t.string :hash_tag

      t.timestamps
    end
  end
end
