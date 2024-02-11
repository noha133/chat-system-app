class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :text
      t.integer :message_number
      t.references :chat, null: false, foreign_key: true

      t.timestamps
    end
    add_index :messages, :message_number
  end
end
