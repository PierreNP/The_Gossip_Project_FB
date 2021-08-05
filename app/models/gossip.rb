class Gossip < ApplicationRecord
  belongs_to :user
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags
  has_many :comments
  # belongs_to :city, foreign_key: 'user_id'

  validates :title,  
    length: { in: 4..14 },
    presence: true

  validates :content, presence: true


end
