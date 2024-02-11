class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.integer :messages_count
      t.integer :chat_id
      t.references :app, null: false, foreign_key: true

      t.timestamps
    end
    add_index :chats, :chat_id
  end
end
