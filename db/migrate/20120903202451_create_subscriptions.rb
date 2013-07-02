class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.datetime :created_at
      t.references :member
      t.references :campaign

      t.timestamps
    end
    add_index :subscriptions, :member_id
    add_index :subscriptions, :campaign_id
  end
end
