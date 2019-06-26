class CreateDealers < ActiveRecord::Migration[5.2]
  def change
    create_table :dealers do |t|
      t.string :salesforce_id
      t.string :name
      t.string :street
      t.string :city
      t.string :zip
      t.string :country
      t.string :state
      t.string :phone

      t.decimal :latitude, precision: 11, scale: 8
      t.decimal :longitude, precision: 11, scale: 8
      t.timestamps

      t.index :salesforce_id
    end
  end
end
