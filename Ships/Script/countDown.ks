print "Initializing count down:".
set countdown to 11.
until countdown = 0 {
	wait 1.
	clearScreen.
	set countdown to countdown - 1.
	print "T- " + countdown.
}
