Factory.define :user do |user|
	user.name										"Michael Hartl"
	user.email									"mhartl@example.com"
	user.password								"foobar"
	user.password_confirmation 	"foobar"
	user.nation 								"italy"
end

Factory.define :move do |move|
	move.destination 						"galicia"
	move.origin									"budapest"
end