class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :provider
      t.string :name
      t.string :data
      t.timestamps
    end
  end
end
