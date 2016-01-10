parameter id.
parameter depth.
copy dock_lib from 0.
run dock_lib.
clearscreen.
print "Starting undocking procedure...".
local port is getPort(id).
local pnl is prepPort(port,depth).
print "Undocking port...".
port:undock().
wait 10.
restorePnL(pnl).
print "Undocking complete.".
