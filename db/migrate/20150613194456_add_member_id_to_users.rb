class AddMemberIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :member_id, :integer, index: true, foreign_key: true
  end
end
