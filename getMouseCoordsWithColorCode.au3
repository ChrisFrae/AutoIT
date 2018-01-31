; getMouseCoordsWithColorCode v 1.0
; By Christoph F.
; This Program get the Mouse Position (X and Y Coordinates) with Hex and Dec Color Code
; Press ESC Button twice, to close Program

HotKeySet("{ESC}","TerminateProgram")

Global $FlagTerminate ;For Function TerminateProgram()

$sMessage = ""
$SMessage_Seperator = "---------------------------"

SplashTextOn("Mouse Position and Color", "", 200, 225, 5, 5, "")
Do
Local $aPos = MouseGetPos()
Local $iColor = PixelGetColor($aPos[0], $aPos[1])
    $sMessage = "Screen Cursor Position:" & @CRLF & "X: " & $aPos[0] & @CRLF & "Y: " & $aPos[1] & @CRLF & $SMessage_Seperator & @CRLF & "Color at position:" & @CRLF & "Color DEC: " & $iColor & @CRLF & "Color HEX: " & Hex($iColor, 6) & @CRLF & $SMessage_Seperator & @CRLF & "Press 'ESC'-Button" & @CRLF & "twice to Exit"
    ControlSetText("Mouse Position and Color", "", "Static1", $sMessage)
	Sleep(100)
Until $FlagTerminate = 2

Func TerminateProgram() ;Terminate Program
    $FlagTerminate = $FlagTerminate + 1
	$Countdown = 5
	While $FlagTerminate <> 0
		If $FlagTerminate = 1 Then
			While $Countdown <> 0
				ControlSetText("Mouse Position and Color", "", "Static1",  @CRLF & @CRLF & @CRLF & @CRLF & "Press ESC again to close" & @CRLF & $Countdown)
				$Countdown = $Countdown - 1
				Sleep(1000)
				if $Countdown = 0 Then
					$FlagTerminate = 0
				EndIf
			WEnd
			ElseIf $FlagTerminate = 2 Then
			Exit
		EndIf
	WEnd
EndFunc

