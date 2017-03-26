class AddTaglineToTools < ActiveRecord::Migration
  def change
    add_column :tools, :tagline, :string
  end
end
