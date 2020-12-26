# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
vgsList = [
    ["v", false, ""],
    ["va", false, "Attack"],
    ["vaa", true, "Attack!"],
    ["vat", false, "Tower"],
    ["va1", true, "Attack Left lane!"],
    ["vb", false, "Enemy"],
    ["vc", false, "Careful"]
]

Element.destroy_all

vgsList.each do |line|
    Element.create({combo: line[0], final: line[1], value: line[2]})
end