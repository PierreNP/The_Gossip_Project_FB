class User < ApplicationRecord
  has_secure_password
  belongs_to :city
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage' #OK
  has_many :user_private_messages, foreign_key: 'recipient_id', class_name: 'UserPrivateMessage'
  has_many :received_messages, foreign_key: 'recipient_id', class_name: 'PrivateMessage', through: :user_private_messages
  has_many :gossips
  has_many :comments
  validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "Seulement des lettres dans le prénom sauf si tu es la fille d'Elon Musk" }
  validates :password, presence: true, length: { minimum: 6, message: 'Le mdp doit faire plus de 6 caractères !' }
end