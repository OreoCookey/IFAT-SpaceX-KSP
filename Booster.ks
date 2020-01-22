CORE:PART:GETMODULE("kOSProcessor"):DOEVENT("Open Terminal").


CLEARSCREEN.



//This is our countdown loop, which cycles from 10 to 0
PRINT "Counting down:".
FROM {local countdown is 38.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
    PRINT "..." + countdown.
    WAIT 1. // pauses the script here for 1 second.
}

set done to False.

set a to 90.
set b to 90.

SET MYSTEER TO HEADING(a,b).
//LOCK STEERING TO MYSTEER.

CLEARSCREEN.

lock throttle TO 0.75.
SAS ON.   
set count to 0.
stage.
wait 2.
AG2 ON.




until done = True{
	 PRINT SHIP:ALTITUDE AT(0,1).
	set count to count + 3.	
	
	if SHIP:ALTITUDE > 300 {
		set b to b-2.
		SAS OFF.
		LOCK STEERING TO MYSTEER.
		SET MYSTEER TO HEADING(a,b).
	
	
	}
	
	when count > 85 THEN {
		set done to True.
	
	}
	
	if SHIP:ALTITUDE > 80000 {

		LOCK throttle TO 0.6.   
	
	}

	wait 3.
	
	

}
Lock throttle to 0.5.
wait 1.
LOCK THROTTLE TO 0.0. 


//This is our countdown loop, which cycles from 10 to 0
PRINT "Until explosion:".
FROM {local countdown is 5.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
    PRINT "..." + countdown.
    WAIT 1. // pauses the script here for 1 second.
}


AG9 ON.





