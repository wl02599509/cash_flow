class CreateDonateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :donate_items do |t|
      t.string :title

      t.timestamps
    end
  end
end
