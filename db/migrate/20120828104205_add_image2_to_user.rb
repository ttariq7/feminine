class AddImage2ToUser < ActiveRecord::Migration
  def change
    add_column :users, :image2, :string
  end
end
