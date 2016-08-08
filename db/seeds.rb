# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cat = Category.create!(name: "pens")
opt_group = cat.option_groups.create!(name: "general info")
opt = opt_group.options.create!(name: "color", value_type: 'String', option_element: TextOption.create)
v1 = opt.option_values.create!(value_element: StringValue.create(value: "red"))
opt.option_values.create!(value_element: StringValue.create(value: "green"))
opt.option_values.create!(value_element: StringValue.create(value: "blue"))

opt = opt_group.options.create!(name: "size", value_type: 'String', option_element: SelectOption.create)
opt.option_values.create!(value_element: StringValue.create(value: "small"))
v2 = opt.option_values.create!(value_element: StringValue.create(value: "medium"))
opt.option_values.create!(value_element: StringValue.create(value: "large"))

opt_group = cat.option_groups.create!(name: "specifications")
opt = opt_group.options.create!(name: "pen body", value_type: 'String', option_element: SelectOption.create)
opt.option_values.create!(value_element: StringValue.create(value: "plastic"))
opt.option_values.create!(value_element: StringValue.create(value: "gold"))
v3 = opt.option_values.create!(value_element: StringValue.create(value: "platinum"))

opt = opt_group.options.create!(name: "rod quantity", value_type: 'Integer', option_element: SelectOption.create)
v4 = opt.option_values.create!(value_element: IntegerValue.create(value: 1))
opt.option_values.create!(value_element: IntegerValue.create(value: 2))
opt.option_values.create!(value_element: IntegerValue.create(value: 3))
opt.option_values.create!(value_element: IntegerValue.create(value: 4))

i = cat.items.create!(name: 'parker')
i.properties.create!(option_value: v1)
i.properties.create!(option_value: v2)
i.properties.create!(option_value: v3)
i.properties.create!(option_value: v4)