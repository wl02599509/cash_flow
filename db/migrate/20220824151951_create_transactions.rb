class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :donate_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
