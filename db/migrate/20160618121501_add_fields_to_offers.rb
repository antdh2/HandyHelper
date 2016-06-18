class AddFieldsToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :buyer_id, :integer
    add_column :offers, :seller_id, :integer
  end
end
