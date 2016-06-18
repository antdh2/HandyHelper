class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.decimal :price
      t.string :status
      t.boolean :is_accepted

      t.timestamps null: false
    end
  end
end
