class ArtworkShares < ApplicationRecord

    belongs_to :arts,
        foreign_key: :artwork_id,
        class_name: :Artwork
    
    belongs_to :viewer,
        foreign_key: :viewer_id,
        class_name: :User
    

end