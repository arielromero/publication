class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.datetime :begin_at
      t.datetime :finish_at

      t.timestamps
    end
  end
end
