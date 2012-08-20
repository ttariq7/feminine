class AddKyahaiToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :kyahai, :string
  end
end
