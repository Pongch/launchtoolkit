class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
