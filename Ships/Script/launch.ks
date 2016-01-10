local thrtl is 1.0.
lock throttle to thrtl.
sas on.
lock steering to up.
local countdown is 5.
print "Throttled up, engaged SAS and steered up.".
print "Starting count down:".
lock countdown to countdown-1.
until countdown=0 {
	print "T- "+countdown.
	wait 1.
}
print "Lift off!".
stage.
wait 2.
lock sf to stage:solidFuel.
when stage:liquidFuel<0.001 then {
	if sf>0 {
		wait until sf<0.001.
		local type is "solid".
	} else {
		local type is "liquid".
	}
	print "No "+type+" fuel. Attempting to stage.".
	stage.
	preserve.
}
//todo: throttles too fast
lock thrtl to thrtl-0.1.
when ship:velocity:surface:x > 200 then {
	print "Surface velocity exceeding 200m/s; throttled down to "+thrtl+".".
	if ship:altitude<10000 {preserve.}
}
wait until ship:altitude>10000.
print "Starting turn. Aiming to a 45 deg pitch.".
local angle is 89.
lock steering to heading(90,angle).
lock angle to angle-2.
lock thrtl to (1.0-thrtl)/2+thrtl.
until angle=45 {
	print "Currently at "+angle+" deg.".
	wait 2.
}
unlock thrtl.
local thrtl is 1.0.
print "Finished turning. Aimed at "+angle+" deg.".
wait until ship:obt:apoapsis>90000.
local thrtl is 0.5.
wait until ship:obt:apoapsis>100000.
local thrtl is 0.0.
print "Apoapsis should now be at 100km.".
wait until ship:altitude>950000.
print "Aiming to horizon.".
until angle=0 {
	print "Currently at "+angle+" deg.".
	wait 2.
}
print "Finished turning. Aimed at "+angle+" deg.".
print "Starting circularization.".
local thrtl is 1.0.
wait until ship:obt:periapsis>90000.
local thrtl is 0.5.
wait until ship:obt:periapsis>100000.
local thrtl is 0.0.
print "Should now be in a stable orbit.".
unlock steering.
