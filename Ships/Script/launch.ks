set thrtl to 1.0.
print "Main throttle up.".
lock throttle to thrtl.
print "Engaging SAS and steering up.".
sas on.
lock steering to up.
set countdown to 10.
print "Initializing count down:".
until countdown = 0 {
	print "T- " + countdown.
	set countdown to countdown - 1.
	wait 1.
}
print "Lift off!".
stage.
wait 2.
when stage:liquidFuel < 0.001 then {
	print "No liquid fuel. Attempting to stage.".
	stage.
	preserve.
}
//todo: throttles too fast; need to fix conditional
when ship:velocity:surface:x > 200 then {
	set thrtl to thrtl - 0.1.
	print "Orbital velocity exceeding 200m/s; throttled down to "+thrtl+".".
	if ship:altitude < 10000 {preserve.}
}
wait until ship:altitude > 10000.
set angle to 89.
set thrtl to (1.0-thrtl)/2+thrtl.
print "Starting turn. Aiming to 45 deg pitch.".
lock steering to heading(90,angle).
until angle = 45 {
	print "Currently at "+angle+" deg.".
	set angle to angle - 1.
	wait 2.
}
set thrtl to 1.0.
print "Finished turning. Aimed at "+angle+" deg.".
wait until ship:altitude > 100000.
print "Starting circularization. Aiming to horizon.".
until angle = 0 {
	print "Currently at "+angle+" deg.".
	set angle to angle - 1.
	wait 2.
}
print "Finished turning. Aimed at "+angle+" deg.".
print "Next step not yet developed".
