# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cat = Category.create!(name: "pens")
opt_group = cat.option_groups.create!(name: "general info")
opt = opt_group.options.create!(name: "color")
opt.option_values.create!(value: "red")
opt.option_values.create!(value: "green")
opt.option_values.create!(value: "blue")
opt = opt_group.options.create!(name: "size")
opt.option_values.create!(value: "small")
opt.option_values.create!(value: "medium")
opt.option_values.create!(value: "large")