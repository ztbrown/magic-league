# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

users = []
users << User.find_or_create_by(email: "patrickwroach@gmail.com", name: "Pat Roach", admin: true)
users << User.find_or_create_by(email: "zack.t.brown@gmail.com", name: "Zack Brown")
users << User.find_or_create_by(email: "mike@gmail.com", name: "Mike Stempler")
users << User.find_or_create_by(email: "joe@gmail.com", name: "Joe Handzel", admin: true)
users << User.find_or_create_by(email: "dustin@gmail.com", name: "Dustin Perzanowski")
users << User.find_or_create_by(email: "ryan@gmail.com", name: "Ryan Branch")
users << User.find_or_create_by(email: "perz13@gmail.com", name: "D#R", admin: true)

users.each {|user| user.collection = Collection.new; user.password = "12345678"; user.save!}
