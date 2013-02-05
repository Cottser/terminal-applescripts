if application "Finder" is frontmost then
	tell application "Finder"
		set activePath to (POSIX path of (target of window 1 as alias))
	end tell
	OpenInTerminal(activePath)
end if


on OpenInTerminal(currentPath)
	tell application "Terminal"
		activate
		(*
	For whatever reason, Terminal doesn't really have an accessible way to create new tabs through AppleScript, so the long, hacky looking line in the middle just tells Terminal to type Cmd-T to open that new tab, and then new commands will execute in it.
	http://apple.stackexchange.com/questions/15317/how-can-i-write-a-script-to-open-multiple-terminal-tabs-and-execute-code-in-them/15328#15328
	*)
		delay 0.25
		tell application "System Events" to tell process "Terminal" to keystroke "t" using command down
		do script "cd " & quoted form of currentPath & "; clear" in front window
	end tell
end OpenInTerminal