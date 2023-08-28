class AddStatusToImpressions < ActiveRecord::Migration[6.1]
  def change
    add_column :impressions, :status, :integer, default: 0, null: false
  end
end
