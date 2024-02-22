class AddDefaultValueToChataCount < ActiveRecord::Migration[7.1]
  def change
    change_column :apps, :chats_count, :integer, default: 0
  end
end
