class CreateSippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :sipping_addresses do |t|

      t.timestamps
    end
  end
end
