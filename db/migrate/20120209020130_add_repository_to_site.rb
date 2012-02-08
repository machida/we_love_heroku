class AddRepositoryToSite < ActiveRecord::Migration
  def change
    add_column :sites, :repository_url, :string
  end
end
