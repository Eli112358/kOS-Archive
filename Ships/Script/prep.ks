print "Main throttle up.".
set ship:control:pilotMainThrottle to 1.
wait 1.
print "Engaging SAS.".
sas on.
set sasMode to "stabilityAssist".
wait 1.
