class CreateImpressions < ActiveRecord::Migration[6.1]
  def change
    create_table :impressions do |t|
      
      t.integer :customer_id
      t.integer :genre_id
      t.string :title, null: false
      t.text :body, null: false
      t.float :rate, null: false

      t.timestamps
    end
  end
end
