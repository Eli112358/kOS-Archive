print "Preparing to circularize...".
// set sas mode to "prograde"
print "Waiting for apoapsis...".
wait until (ship:obt:apoapsis-ship:altitude)<1000.
print "Reached apoapsis. Starting circularization burn...".
// set throttle to 1.0.
wait until (ship:obt:apoapsis-ship:obt:periapsis)<1000.
// set throttle to 0.0.
print "Circularization complete.".
print "Apoapsis="+ship:obt:apoapsis.
print "Periapsis="+ship:obt:periapsis.
print "Altitude="+ship:altitude .
print "Error="+(ship:obt:apoapsis-ship:obt:periapsis)/ship:obt:apoapsis+"%".
print "End of script.".
