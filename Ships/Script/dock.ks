parameter id.
parameter depth.
copy dock_lib from 0.
run dock_lib.
clearscreen.
print "Starting docking procedure...".
local port is getPort(id).
local pnl is prepPort(port,depth).
print "Ready for docking.".
wait until getPortState(port)>2.
restorePnL(pnl).
print "Docking complete.".
