class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  has_many :user_private_messages, foreign_key: 'received_message_id' #, class_name :'PrivateMessage'
  has_many :recipients, foreign_key: 'recipient_id', class_name: 'User', through: :user_private_messages
end
