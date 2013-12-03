class AddAbbreviationToProducts < ActiveRecord::Migration
  def change
    add_column :products, :abbreviation, :string
  end
end
