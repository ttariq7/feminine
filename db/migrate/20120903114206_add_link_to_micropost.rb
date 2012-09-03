class AddLinkToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :link, :text
  end
end
