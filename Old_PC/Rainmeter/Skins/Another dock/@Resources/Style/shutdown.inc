[Rainmeter]
MouseScrollUpAction=[!CommandMeasure "ShutdownScript" "timer_increase()"]
MouseScrollDownAction=[!CommandMeasure "ShutdownScript" "timer_decrease()"]

[Variables]
TT=10 second

[ShutdownScript]
Measure=Script
ScriptFile=#@#Style\shutdown.lua

[TimerMeter]
Meter=String
StringAlign=CenterTop
FontFace=Aovel Sans
FontColor=255,255,255
FontSize=15
;SolidColor=10,10,10,255
X=(#CURRENTCONFIGWIDTH#/2)
Y=0
Text=#TT#
AntiAlias=1
DynamicVariables=1
SolidColor=0,0,0,1
Hidden=1
InlineSetting=Shadow | 0 | 0 | 2 | 0,0,0
InlineSetting2=Shadow | 0 | 0 | 3 | 0,0,0
InlineSetting3=Shadow | 0 | 0 | 4 | 0,0,0