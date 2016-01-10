function findLights {
	parameter part.
	local lights is list().
	for p in part:children {
		if matchName(p,list("spotLight1","spotLight2")) {
			lights:add(p).
		}
	}
	return lights.
}
function findPanels {
	parameter part.
	parameter depth.
	local panels is list().
	local part2 is part.
	from {local x is 0.} until x=depth step {set x to x+1.} do {
		if panels:length=0 {
			for p in part:children {
				if matchName(p,list("solarPanals2")) {
					panels:add(p).
				}
			}
		}
		if panels:length>0 {
			break.
		}
	}
	return panels.
}
function getPort {
	parameter id.
	local ports is ship:partsTagged("Port-"+id).
	if ports:length>0 {
		return ports[0].
	}
	print "Port not found.".
	return getPort(0).
}
function getPortState {
	parameter port.
	local states is list("Disabled","Ready","PreAttached","Docked (docker)","Docked (dockee)","Docked (same vessel)").
	from {local x is 0.} until x=states:length step {set x to x+1.} do {
		if port:state=states[x] {
			return x.
		}
	}
}
function matchName {
	parameter part.
	parameter names.
	for n in names {
		if part:name=n {
			return true.
		}
	}
	return false.
}
function doAction {
	parameter parts.
	parameter module.
	parameter action.
	parameter value.
	for p in parts {
		part:getModule(module):doAction(action,value).
	}
}
function prepPort {
	parameter port.
	parameter depth.
	print "Looking for solar panels...".
	local panels is findPanels(port:parent,depth).
	print "Found "+panels:length+" panels. Retracting them...".
	doAction(panels,"ModuleDeployableSolarPanel","retract panel",true).
	local last is panels[panels:length-1].
	waitForPart(last,"","","").
	print "Looking for lights...".
	local lights is findLights(port:parent).
	print "Found "+lights:length+" lights. Turning them on...".
	doAction(lights,"ModuleLight","turn light on",true).
	return list(panels,lights).
}
function retorePnL {
	parameter pnl.
	print "Restoring lights and solar panels...".
	doAction(pnl[1],"ModuleLight","extend panel",true).
	doAction(pnl[0],"ModuleDeployableSolarPanel","turn light off",true).
	local last is pnl[0][panels:length-1].
	waitForPart(last,"","","").
}
function tagPorts {
	local ports is ship:dockingPorts.
	from {local x is 0.} until x=ports:length step {set x to x+1.} do {
		set ports[x]:tag to "Port-"+x.
	}
}
function waitForPart {
	parameter part.
	parameter module.
	parameter field.
	parameter value.
	wait until part:getModule(module):getField(field)=value.
}
