class RenameChatIdtoChatNumber < ActiveRecord::Migration[7.1]
  def change
    rename_column :chats, :chat_id, :chat_number
  end
end
