class AddSchoolyearToUser < ActiveRecord::Migration
  def change
    add_column :users, :schoolyear, :string
  end
end
