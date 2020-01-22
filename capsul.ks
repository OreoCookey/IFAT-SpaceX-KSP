CORE:PART:GETMODULE("kOSProcessor"):DOEVENT("Open Terminal").
CLEARSCREEN.


//This is our countdown loop, which cycles from 10 to 0
PRINT "Counting down:".
FROM {local countdown is 128.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
    PRINT "..." + countdown.
    WAIT 1. // pauses the script here for 1 second.
}

AG1 ON.
lock throttle to 1.0.
wait 10.
LOCK STEERING TO PROGRADE.

CLEARSCREEN.
lock throttle to 0.0.
until ETA:APOAPSIS < 10 {
	PRINT "ETA Apoapsis " + ETA:APOAPSIS AT (0,1).

}
CLEARSCREEN.
AG7 ON.
RCS ON.
SAS OFF.

set landed to False.

set trunk_separated to False.

set p1 to False.
set p2 to False.
set p3 to False.

until landed = True{
	
	if trunk_separated = False{
		LOCK STEERING TO SHIP:SRFRETROGRADE.
		wait 4.
		AG10 ON.
		set trunk_separated to True.
	
	}
	

	
	
	
	if p1 = False{
		if ship:altitude < 12000 {
			stage.
			wait 1.
			stage.
			set p1 to True.
		
		}
	
	}
	
	if p2 = False{
		if ship:altitude < 3000 {
			stage.
			set p2 to True.
		
		}
	
	}
	
	
	if p3 = False{
		if ship:altitude < 2500 {
			AG4 ON.
			set p3 to True.
			wait 1.
			set landed to true.
		
		}
	
	}	
	

}
SET SHIP:CONTROL:PILOTMAINTHROTTLE TO 0.
print "End script".




