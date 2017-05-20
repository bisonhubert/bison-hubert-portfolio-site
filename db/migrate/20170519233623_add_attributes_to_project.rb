class AddAttributesToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :title, :string
    add_column :projects, :description, :text
    add_column :projects, :image, :string
    add_column :projects, :demo_link, :string
    add_column :projects, :github_link, :string
  end
end
