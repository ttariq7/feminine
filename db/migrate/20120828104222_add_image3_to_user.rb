class AddImage3ToUser < ActiveRecord::Migration
  def change
    add_column :users, :image3, :string
  end
end
