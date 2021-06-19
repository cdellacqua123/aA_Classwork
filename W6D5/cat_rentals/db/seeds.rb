# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
cat1 = Cat.create!(birth_date: '2020/01/20', color: 'brown', name: 'chuck', sex: 'm', description: 'I am a brown cat named chuck')
cat2 = Cat.create!(birth_date: '1020/01/20', color: 'grey', name: 'steve', sex: 'm', description: 'I am a grey cat named steve')
cat3 = Cat.create!(birth_date: '1995/01/20', color: 'calico', name: 'pete', sex: 'm', description: 'I am a calico cat named pete')
cat4 = Cat.create!(birth_date: '1985/01/20', color: 'black', name: 'wendy', sex: 'f', description: 'I am a black cat named wendy')