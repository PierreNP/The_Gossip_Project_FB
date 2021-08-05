class CreateUserPrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :user_private_messages do |t|
      t.belongs_to :received_message, index: true
      t.belongs_to :recipient, index: true

      t.timestamps
    end
  end
end
