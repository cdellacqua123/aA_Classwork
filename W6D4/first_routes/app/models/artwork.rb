class Artwork < ApplicationRecord
    
    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User
    has_many :shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShares
    
    has_many :shared_viewers,
        through: :artist,
        source: :shares
    
end