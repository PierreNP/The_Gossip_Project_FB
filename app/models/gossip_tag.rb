class GossipTag < ApplicationRecord
  belongs_to :gossip
  belongs_to :tag
end

#atouter validation pour éviter doublon de tag sur un gossip donné