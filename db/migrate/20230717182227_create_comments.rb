class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :customer_id
      t.integer :impression_id
      t.text :post_comment, null: false

      t.timestamps
    end
  end
end
