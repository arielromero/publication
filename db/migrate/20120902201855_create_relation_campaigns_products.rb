class CreateRelationCampaignsProducts < ActiveRecord::Migration
  def up
    create_table :campaigns_products do |t|
      t.references :campaign
      t.references :product
    end
  end

  def down
    drop_table :campaigns_products
  end
end
