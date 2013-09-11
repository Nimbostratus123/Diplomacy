Factory.define :user do |user|
	user.name									"Michael Hartl"
	user.email									"mhartl@example.com"
	user.password								"foobar"
	user.nation 								"italy"
end

Factory.define :move do |move|
	move.destination 						"galicia"
	move.origin								"budapest"
end

Factory.define :unit do |unit|
	unit.user_id			30
	unit.location			"paris"
	unit.destination		"gascony"
	unit.support			0
	unit.kind				"army"
end