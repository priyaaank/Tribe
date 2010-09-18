require 'faker'
require 'sequel'

reviews = Sequel.connect('sqlite://grapevine.db').from(:reviews)

[ARGV.first.to_i, 15].max.times do
	reviews.insert(:image_url => "http://www.#{Faker::Internet.domain_name}/#{rand(99999)}",
								 :text => Faker::Lorem.paragraph,
								 :latitude => rand(999999) / 1000.0,
								 :longitude => rand(999999) / 1000.0)
end
