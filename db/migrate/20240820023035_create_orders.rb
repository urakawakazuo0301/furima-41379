class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user,       nil: false, foreign_key: true
      t.references :item,       nil: false, foregin_key: true
      t.timestamps
    end
  end
end
