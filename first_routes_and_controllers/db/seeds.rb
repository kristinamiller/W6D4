# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

user1 = User.create!(username: 'BobRoss')
user2 = User.create!(username: 'Picasso')
user3 = User.create!(username: 'Freida')
user4 = User.create!(username: 'Copper')

artwork1 = Artwork.create!(title: 'waterfall', image_url: 'waterfallllll', artist_id: user1.id)
artwork2 = Artwork.create!(title: 'melting clocks', image_url: 'im meltinggggg', artist_id: user2.id)
artwork3 = Artwork.create!(title: 'unicorn', image_url: 'magicallll', artist_id: user3.id)

artwork_share1 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user4.id )
artwork_share2 = ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user1.id )
artwork_share3 = ArtworkShare.create!(artwork_id: artwork3.id, viewer_id: user2.id )