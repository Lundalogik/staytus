class AddSupportUrlToSite < ActiveRecord::Migration[5.1]
  def change
    add_column :sites, :support_url, :string
  end
end
