on run argv
	set direction to item 1 of argv
	set delta to (item 2 of argv) as integer

	tell application "System Events"
		set frontApp to name of first application process whose frontmost is true
		tell application process frontApp
			if (count of windows) is 0 then return
			set winSize to size of front window
			if direction is "left" then
				set item 1 of winSize to (item 1 of winSize) - delta
			else if direction is "right" then
				set item 1 of winSize to (item 1 of winSize) + delta
			else if direction is "up" then
				set item 2 of winSize to (item 2 of winSize) - delta
			else if direction is "down" then
				set item 2 of winSize to (item 2 of winSize) + delta
			else
				error "unknown direction: " & direction
			end if
			set size of front window to winSize
		end tell
	end tell
end run
