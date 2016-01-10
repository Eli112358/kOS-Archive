copy lib_iif from 0.
run lib_iif.
print "Checking mod availability...".
set availMods to "none".
set agxBit to 0.
set rtBit to 0.
set kacBit to 0.
set agxName to "Action Group Extended".
set rtName to "RemoteTech".
set kacName to "Kerbal Alarm Clock".
if addOns:AGX:available = true {set agxBit to 4.}.
if addOns:RT:available = true {set rtBit to 2.}.
if addOns:KAC:available = true {set kacBit to 1.}.
set binVal to agxBit+rtBit+kacBit.
if binVal < 4 {
	set availMods to iif(binVal=1,kacName,rtName+iif(binVal=3," and "+kacName,"")).
} else {
	set availMods to agxName.
	if binVal > 4 {set availMods to availMods+iif(binVal=7,","+rtName+" and "+kacName," and "+iif(binVal=6,rtName,kacName)).}
}
print "Available mods: "+availMods+".".
