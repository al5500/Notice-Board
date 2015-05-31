# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
u1 = User.create :name => 'Alan', :suburb => 'Terrey Hills', :email => 'awright5500@gmail.com', :phone => '0458824398', :image => 'http://fc01.deviantart.net/fs70/i/2013/078/2/b/finn_the_human__by_toastwaffleart-d5ylzg7.png'