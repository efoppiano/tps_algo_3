!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'north south east west'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:46'!
test01RoverCanProcessEmptyCommands
	
	| rover |
	rover := MarsRover at: 1@1 facing: north.
	
	rover execute: ''.
	
	self assertRover: rover isAt: 1@1 facing: north
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:45'!
test02RoverFacingNorthCanMoveForward
	
	| rover |
	rover := MarsRover at: 1@1 facing: north.
	
	rover execute: 'f'.
	
	self assertRover: rover isAt: 1@2 facing: north.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:46'!
test03RoverFacingSouthCanMoveForward
	
	| rover |
	rover := MarsRover at: 1@1 facing: south.
	
	rover execute: 'f'.
	
	self assertRover: rover isAt: 1@0 facing: south! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:45'!
test04RoverFacingEastCanMoveForward
	
	| rover |
	rover := MarsRover at: 1@1 facing: east.
	
	rover execute: 'f'.

	self assertRover: rover isAt: 2@1 facing: east! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:45'!
test05RoverFacingWestCanMoveForward
	
	| rover |
	rover := MarsRover at: 1@1 facing: west.
	
	rover execute: 'f'.
	
	self assertRover: rover isAt: 0@1 facing: west! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:45'!
test06RoverFacingNorthCanMoveBackwards
	
	| rover |
	rover := MarsRover at: 1@1 facing: north.
	
	rover execute: 'b'.

	self assertRover: rover isAt: 1@0 facing: north! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:45'!
test07RoverFacingSouthCanMoveBackwards
	
	| rover |
	rover := MarsRover at: 1@1 facing: south.
	
	rover execute: 'b'.
	
	self assertRover: rover isAt: 1@2 facing: south! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:45'!
test08RoverFacingEastCanMoveBackwards
	
	| rover |
	rover := MarsRover at: 1@1 facing: east.
	
	rover execute: 'b'.
	
	self assertRover: rover isAt: 0@1 facing: east! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:45'!
test09RoverFacingWestCanMoveBackwards
	
	| rover |
	rover := MarsRover at: 1@1 facing: west.
	
	rover execute: 'b'.

	self assertRover: rover isAt: 2@1 facing: west! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:45'!
test10RoverFacingNorthCanTurnLeft
	
	| rover |
	rover := MarsRover at: 1@1 facing: north.
	
	rover execute: 'l'.

	self assertRover: rover isAt: 1@1 facing: west! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:46'!
test11RoverFacingSouthCanTurnLeft
	
	| rover |
	rover := MarsRover at: 1@1 facing: south.
	
	rover execute: 'l'.
	
	self assertRover: rover isAt: 1@1 facing: east! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:45'!
test12RoverFacingEastCanTurnLeft
	
	| rover |
	rover := MarsRover at: 1@1 facing: east.
	
	rover execute: 'l'.
	
	self assertRover: rover isAt: 1@1 facing: north! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:45'!
test13RoverFacingWestCanTurnLeft
	
	| rover |
	rover := MarsRover at: 1@1 facing: west.
	
	rover execute: 'l'.
	
	self assertRover: rover isAt: 1@1 facing: south! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:45'!
test14RoverFacingNorthCanTurnRight
	
	| rover |
	rover := MarsRover at: 1@1 facing: north.
	
	rover execute: 'r'.
	
	self assertRover: rover isAt: 1@1 facing: east! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:45'!
test15RoverFacingSouthCanTurnRight
	
	| rover |
	rover := MarsRover at: 1@1 facing: south.
	
	rover execute: 'r'.
	
	self assertRover: rover isAt: 1@1 facing: west! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:45'!
test16RoverFacingEastCanTurnRight
	
	| rover |
	rover := MarsRover at: 1@1 facing: east.
	
	rover execute: 'r'.
	
	self assertRover: rover isAt: 1@1 facing: south! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:46'!
test17RoverFacingWestCanTurnRight
	
	| rover |
	rover := MarsRover at: 1@1 facing: west.
	
	rover execute: 'r'.
	
	self assertRover: rover isAt: 1@1 facing: north! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:46'!
test18RoverCanExecuteMultipleCommandsAtOnce
	
	| rover |
	rover := MarsRover at: 1@1 facing: north.
	
	rover execute: 'ffrblfr'.
	
	self assertRover: rover isAt: 0@4 facing: east! !

!MarsRoverTest methodsFor: 'tests' stamp: 'EF 7/1/2021 14:03:46'!
test19RoverStopsRunningCommandsIfItFindsAnInvalidCommand
	
	| rover |
	rover := MarsRover at: 1@1 facing: north.
	
	self
	should: [ rover execute: 'fxfrb' ]
	raise: Error
	withExceptionDo: [ :anError | 
		anError messageText = MarsRover commandNotUnderstoodErrorMessage.
		self assertRover: rover isAt: 1@2 facing: north ]! !


!MarsRoverTest methodsFor: 'asserts' stamp: 'EF 7/1/2021 10:43:08'!
assertRover: aRover isAt: aPosition facing: anOrientation

	self assert: (aRover isAt: aPosition).
	self assert: (aRover isFacing: anOrientation).! !


!MarsRoverTest methodsFor: 'setUp' stamp: 'EF 6/29/2021 13:24:00'!
setUp

	north := MarsRover north.
	south := MarsRover south.
	east := MarsRover east.
	west := MarsRover west.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'EF 7/1/2021 13:24:43'!
initializeIn: aPosition facing: anOrientation 
	
	position := aPosition.
	orientation := anOrientation! !


!MarsRover methodsFor: 'executing' stamp: 'EF 6/29/2021 11:18:29'!
execute: commandCharacters
	
	commandCharacters do: [ :aCommandCharacter | self processCommandCharacter: aCommandCharacter ].! !


!MarsRover methodsFor: 'testing' stamp: 'EF 6/29/2021 10:39:57'!
isAt: aPosition

	^position = aPosition! !

!MarsRover methodsFor: 'testing' stamp: 'EF 7/1/2021 13:25:52'!
isFacing: anOrientation

	^orientation = anOrientation! !


!MarsRover methodsFor: 'movement' stamp: 'EF 6/29/2021 11:02:45'!
moveEast

	position := position + (1@0)! !

!MarsRover methodsFor: 'movement' stamp: 'EF 6/29/2021 11:03:02'!
moveNorth

	position := position + (0@1)! !

!MarsRover methodsFor: 'movement' stamp: 'EF 6/29/2021 11:03:09'!
moveSouth

	position := position - (0@1)! !

!MarsRover methodsFor: 'movement' stamp: 'EF 6/29/2021 11:02:52'!
moveWest

	position := position - (1@0)! !


!MarsRover methodsFor: 'rotation' stamp: 'EF 7/1/2021 13:24:12'!
rotateEast

	orientation := MarsRover east! !

!MarsRover methodsFor: 'rotation' stamp: 'EF 7/1/2021 13:24:06'!
rotateNorth

	orientation := MarsRover north! !

!MarsRover methodsFor: 'rotation' stamp: 'EF 7/1/2021 13:23:57'!
rotateSouth

	orientation := MarsRover south! !

!MarsRover methodsFor: 'rotation' stamp: 'EF 7/1/2021 13:23:42'!
rotateWest

	orientation := MarsRover west! !


!MarsRover methodsFor: 'command processing' stamp: 'EF 7/1/2021 11:21:57'!
processCommandCharacter: aCommandCharacter

	| command |
	
	command := RoverCommand newFor: aCommandCharacter.
	command executeIn: self.! !


!MarsRover methodsFor: 'state - private' stamp: 'EF 6/29/2021 13:22:58'!
orientation

	^orientation! !

!MarsRover methodsFor: 'state - private' stamp: 'EF 7/1/2021 13:27:01'!
wheelsState

	^RoverWheelsState newFor: self! !


!MarsRover methodsFor: 'command actions - private' stamp: 'EF 7/1/2021 13:22:25'!
backwards

	self wheelsState backwards ! !

!MarsRover methodsFor: 'command actions - private' stamp: 'EF 7/1/2021 13:22:22'!
forward

	self wheelsState forward! !

!MarsRover methodsFor: 'command actions - private' stamp: 'EF 7/1/2021 13:22:18'!
turnLeft

	self wheelsState turnLeft ! !

!MarsRover methodsFor: 'command actions - private' stamp: 'EF 7/1/2021 13:22:14'!
turnRight

	self wheelsState turnRight ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'EF 7/1/2021 14:03:45'!
at: aPosition facing: anOrientation
	
	^self new initializeIn: aPosition facing: anOrientation.! !


!MarsRover class methodsFor: 'error messages' stamp: 'EF 6/29/2021 11:25:41'!
commandNotUnderstoodErrorMessage

	^'Command not understood' ! !


!MarsRover class methodsFor: 'orientations' stamp: 'EF 6/29/2021 13:11:36'!
east

	^#East! !

!MarsRover class methodsFor: 'orientations' stamp: 'EF 6/29/2021 13:11:24'!
north

	^#North! !

!MarsRover class methodsFor: 'orientations' stamp: 'EF 6/29/2021 13:11:30'!
south

	^#South! !

!MarsRover class methodsFor: 'orientations' stamp: 'EF 6/29/2021 13:11:56'!
west

	^#West! !


!classDefinition: #RoverCommand category: 'MarsRover'!
Object subclass: #RoverCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!RoverCommand methodsFor: 'execute' stamp: 'EF 6/29/2021 13:22:42'!
executeIn: aRover

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RoverCommand class' category: 'MarsRover'!
RoverCommand class
	instanceVariableNames: ''!

!RoverCommand class methodsFor: 'instance creation' stamp: 'EF 6/29/2021 13:35:57'!
newFor: aCommandCharacter

	RoverCommand subclasses detect: [ :aRoverCommandClass | aRoverCommandClass isFor: aCommandCharacter ] 
										      ifFound: [ :classToInstantiate | ^classToInstantiate new ]
										      ifNone: [ ^self error: MarsRover commandNotUnderstoodErrorMessage ].! !


!RoverCommand class methodsFor: 'instance handling - private' stamp: 'EF 6/29/2021 13:34:13'!
isFor: aCommandCharacter

	self subclassResponsibility! !


!classDefinition: #Backwards category: 'MarsRover'!
RoverCommand subclass: #Backwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Backwards methodsFor: 'execute' stamp: 'EF 7/1/2021 11:14:02'!
executeIn: aRover

	aRover backwards! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backwards class' category: 'MarsRover'!
Backwards class
	instanceVariableNames: ''!

!Backwards class methodsFor: 'instance handling - private' stamp: 'EF 6/29/2021 12:52:48'!
isFor: aCommandCharacter

	^aCommandCharacter = $b! !


!classDefinition: #Forward category: 'MarsRover'!
RoverCommand subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Forward methodsFor: 'execute' stamp: 'EF 7/1/2021 11:14:08'!
executeIn: aRover

	aRover forward! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'MarsRover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'instance handling - private' stamp: 'EF 6/29/2021 12:52:48'!
isFor: aCommandCharacter

	^aCommandCharacter = $f.! !


!classDefinition: #TurnLeft category: 'MarsRover'!
RoverCommand subclass: #TurnLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TurnLeft methodsFor: 'execute' stamp: 'EF 7/1/2021 11:14:13'!
executeIn: aRover

	aRover turnLeft! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnLeft class' category: 'MarsRover'!
TurnLeft class
	instanceVariableNames: ''!

!TurnLeft class methodsFor: 'instance handling - private' stamp: 'EF 6/29/2021 12:52:48'!
isFor: aCommandCharacter

	^aCommandCharacter = $l! !


!classDefinition: #TurnRight category: 'MarsRover'!
RoverCommand subclass: #TurnRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TurnRight methodsFor: 'execute' stamp: 'EF 7/1/2021 11:14:17'!
executeIn: aRover

	aRover turnRight! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnRight class' category: 'MarsRover'!
TurnRight class
	instanceVariableNames: ''!

!TurnRight class methodsFor: 'instance handling - private' stamp: 'EF 6/29/2021 12:52:48'!
isFor: aCommandCharacter

	^aCommandCharacter = $r! !


!classDefinition: #RoverWheelsState category: 'MarsRover'!
Object subclass: #RoverWheelsState
	instanceVariableNames: 'rover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!RoverWheelsState methodsFor: 'commands' stamp: 'EF 6/29/2021 13:18:12'!
backwards

	self subclassResponsibility! !

!RoverWheelsState methodsFor: 'commands' stamp: 'EF 6/29/2021 13:18:08'!
forward

	self subclassResponsibility! !

!RoverWheelsState methodsFor: 'commands' stamp: 'EF 6/29/2021 13:18:15'!
turnLeft

	self subclassResponsibility! !

!RoverWheelsState methodsFor: 'commands' stamp: 'EF 6/29/2021 13:18:17'!
turnRight

	self subclassResponsibility! !


!RoverWheelsState methodsFor: 'initialization' stamp: 'EF 6/29/2021 13:12:41'!
initializeWith: aRover

	rover := aRover! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RoverWheelsState class' category: 'MarsRover'!
RoverWheelsState class
	instanceVariableNames: ''!

!RoverWheelsState class methodsFor: 'instance handling - private' stamp: 'EF 7/1/2021 10:47:33'!
isFor: anOrientation

	self subclassResponsibility ! !


!RoverWheelsState class methodsFor: 'instance creation' stamp: 'EF 7/1/2021 13:26:51'!
newFor: aRover
	
	| classToInstantiate |
	classToInstantiate := self subclasses detect: [ :aRoverWheelsState | aRoverWheelsState isFor: aRover orientation ].
	
	^classToInstantiate new initializeWith: aRover ! !


!classDefinition: #WheelsFacingEast category: 'MarsRover'!
RoverWheelsState subclass: #WheelsFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!WheelsFacingEast methodsFor: 'commands' stamp: 'EF 6/29/2021 13:17:38'!
backwards

	rover moveWest! !

!WheelsFacingEast methodsFor: 'commands' stamp: 'EF 6/29/2021 13:17:29'!
forward

	rover moveEast! !

!WheelsFacingEast methodsFor: 'commands' stamp: 'EF 6/29/2021 13:17:51'!
turnLeft

	rover rotateNorth! !

!WheelsFacingEast methodsFor: 'commands' stamp: 'EF 6/29/2021 13:17:58'!
turnRight

	rover rotateSouth! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WheelsFacingEast class' category: 'MarsRover'!
WheelsFacingEast class
	instanceVariableNames: ''!

!WheelsFacingEast class methodsFor: 'instance handling - private' stamp: 'EF 7/1/2021 10:47:47'!
isFor: anOrientation

	^anOrientation = MarsRover east.! !


!classDefinition: #WheelsFacingNorth category: 'MarsRover'!
RoverWheelsState subclass: #WheelsFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!WheelsFacingNorth methodsFor: 'commands' stamp: 'EF 6/29/2021 13:18:56'!
backwards

	rover moveSouth! !

!WheelsFacingNorth methodsFor: 'commands' stamp: 'EF 6/29/2021 13:18:46'!
forward

	rover moveNorth! !

!WheelsFacingNorth methodsFor: 'commands' stamp: 'EF 6/29/2021 13:19:05'!
turnLeft

	rover rotateWest! !

!WheelsFacingNorth methodsFor: 'commands' stamp: 'EF 6/29/2021 13:19:13'!
turnRight

	rover rotateEast! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WheelsFacingNorth class' category: 'MarsRover'!
WheelsFacingNorth class
	instanceVariableNames: ''!

!WheelsFacingNorth class methodsFor: 'instance handling - private' stamp: 'EF 7/1/2021 10:47:51'!
isFor: anOrientation

	^anOrientation = MarsRover north.! !


!classDefinition: #WheelsFacingSouth category: 'MarsRover'!
RoverWheelsState subclass: #WheelsFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!WheelsFacingSouth methodsFor: 'commands' stamp: 'EF 6/29/2021 13:19:32'!
backwards

	rover moveNorth! !

!WheelsFacingSouth methodsFor: 'commands' stamp: 'EF 6/29/2021 13:19:26'!
forward

	rover moveSouth! !

!WheelsFacingSouth methodsFor: 'commands' stamp: 'EF 6/29/2021 13:27:47'!
turnLeft

	rover rotateEast! !

!WheelsFacingSouth methodsFor: 'commands' stamp: 'EF 6/29/2021 13:27:50'!
turnRight

	rover rotateWest! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WheelsFacingSouth class' category: 'MarsRover'!
WheelsFacingSouth class
	instanceVariableNames: ''!

!WheelsFacingSouth class methodsFor: 'instance handling - private' stamp: 'EF 7/1/2021 10:47:57'!
isFor: anOrientation

	^anOrientation = MarsRover south.! !


!classDefinition: #WheelsFacingWest category: 'MarsRover'!
RoverWheelsState subclass: #WheelsFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!WheelsFacingWest methodsFor: 'commands' stamp: 'EF 6/29/2021 13:20:20'!
backwards

	rover moveEast! !

!WheelsFacingWest methodsFor: 'commands' stamp: 'EF 6/29/2021 13:20:12'!
forward

	rover moveWest! !

!WheelsFacingWest methodsFor: 'commands' stamp: 'EF 6/29/2021 13:20:30'!
turnLeft

	rover rotateSouth! !

!WheelsFacingWest methodsFor: 'commands' stamp: 'EF 6/29/2021 13:20:45'!
turnRight

	rover rotateNorth! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WheelsFacingWest class' category: 'MarsRover'!
WheelsFacingWest class
	instanceVariableNames: ''!

!WheelsFacingWest class methodsFor: 'instance handling - private' stamp: 'EF 7/1/2021 10:48:01'!
isFor: anOrientation

	^anOrientation = MarsRover west.! !
