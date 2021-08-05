class UserPrivateMessage < ApplicationRecord
  belongs_to :received_message, class_name: 'PrivateMessage' #foreign_key ?
  belongs_to :recipient, class_name: 'User'
end

# validation : un message ne peut être envoyé 2 fois à la même personne