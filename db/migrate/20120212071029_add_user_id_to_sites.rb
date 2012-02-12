class AddUserIdToSites < ActiveRecord::Migration
  def change
    add_column :sites, :user_id, :integer
    add_index :sites, :user_id, :name => :idx_user_id_on_sites
  end
end
