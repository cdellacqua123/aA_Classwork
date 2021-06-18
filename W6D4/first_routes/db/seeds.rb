# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Artwork shares
#   art_work id
#   viewer id

# Artworks
#   title
#   image url
#   artist id

# User
#   username
User.destroy_all
# Artwork.destroy_all
# ArtworkShares.destroy_all

User.create!([{
    id: 1,
    username: 'user 1'
},{
    id:2,
    username: 'user 2'
},{
    id:3,
    username: 'user 3'
},{
    id:4,
    username: 'user 4'
},{
    id:5,
    username: 'user 5'
},{
    id:6,
    username: 'user 6'
},{
    id:7,
    username: 'user 7'
},{
    id:8,
    username: 'user 8'
},{
    id:9,
    username: 'user 9'
},{
    id:10,
    username: 'user 10'
},{
    id: 11,
    username: 'user 11'
},{
    id: 12,
    username: 'user 12'
},{
    id: 13,
    username: 'user 13'
},{
    id: 14,
    username: 'user 14'
},{
    id: 15,
    username: 'user 15'
}])

# Artwork.create! ([{
#     title: 'tapas comes', 
#     image_url: 'first.com', 
#     artist_id: 2 
# },{
#     title: 'from separate', 
#     image_url: 'second.com', 
#     artist_id: 4 
# },{
#     title: 'jars of the cuisine', 
#     image_url: 'third.com', 
#     artist_id: 3
# },{
#     title: 'The original word', 
#     image_url: 'fourth.com', 
#     artist_id: 8
# },{
#     title: 'tapas comes from', 
#     image_url: 'fifth.com', 
#     artist_id: 10
# },{
#     title: 'It’s not introduced', 
#     image_url: 'sixth.com', 
#     artist_id: 3
# },{
#     title: 'in the early 1900s', 
#     image_url: 'seventh.com', 
#     artist_id: 12
# },{
#     title: 'Hot flavor many', 
#     image_url: 'eigth.com', 
#     artist_id: 14
# },{
#     title: 'dopeweed420', 
#     image_url: 'ninth.com', 
#     artist_id: 15
# }])

# ArtworkShares.create!([{
#     artwork_id: 1,
#     viewer_id: 2
# },{
#     artwork_id: 2,
#     viewer_id: 1

# },{
#     artwork_id: 3,
#     viewer_id: 13
# },{
#     artwork_id: 4,
#     viewer_id: 12
# },{
#     artwork_id: 5,
#     viewer_id: 13
# },{
#     artwork_id: 3,
#     viewer_id: 10
# },{
#     artwork_id: 7,
#     viewer_id: 9
# },{
#     artwork_id: 1,
#     viewer_id: 10
# },{
#     artwork_id: 9,
#     viewer_id: 7
# }])