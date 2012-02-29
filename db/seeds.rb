# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

admin = User.new(:email => "even1990@hotmail.com.tw", :password => "onster",
:password_confirmation => "onster" )
admin.is_admin = true
admin.save!

user1 = User.new(:email => "123@gmail.com", :password => "123123",
:password_confirmation => "123123")
user1.save!

user2 = User.new(:email => "456@gmail.com", :password => "456456",
:password_confirmation => "456456")
user1.save!

board_life = Board.create!(:name => "Life")
board_music = Board.create!(:name => "Music")
board_stuff = Board.create!(:name => "Stuff")