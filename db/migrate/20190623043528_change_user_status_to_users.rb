class ChangeUserStatusToUsers < ActiveRecord::Migration[5.2]

  def up
  	change_column :users, :user_status, :integer, null: false, default: 0
  end

  def down
  	change_column :users, :user_status, :integer, null: true
  end

end
