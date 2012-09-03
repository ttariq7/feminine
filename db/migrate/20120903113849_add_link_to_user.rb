class AddLinkToUser < ActiveRecord::Migration
  def change
    add_column :users, :link, :text
  end
end
