class User < ApplicationRecord

    validates :username, presence: true
    
    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy
    
    has_many :shares,
        foreign_key: :viewer_id,
        class_name: :ArtworkShares,
        dependent: :destroy
    
    has_many :shared_artworks,
        through: :artworks,
        source: :shares

end 