# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
p1 = Post.create(title: "title 1", content: "1 content here")
cat1 = Category.create(name: "1 Super Fly")
com1 = Comment.create(content: "1 is fun")
usr1 = User.create(username: "Charlie")
usr1.comments << com1
p1.categories << cat1
p1.comments << com1
p1.save
usr1.save
