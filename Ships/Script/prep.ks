set trl to 10.
print "Main throttle up.".
lock throttle to trl/10.
wait 1.
print "Engaging SAS and steering up.".
sas on.
lock steering to up.
wait 1.
print "Initializing count down:".
set countdown to 11.
until countdown = 0 {
	wait 1.
	clearScreen.
	set countdown to countdown - 1.
	print "T- " + countdown.
}
stage.
print "Lift off!".
