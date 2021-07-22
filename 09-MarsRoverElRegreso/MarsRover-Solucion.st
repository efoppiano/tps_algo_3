!classDefinition: #TestMarsRover category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:42:57'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:05'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:13'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:24'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:55'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:26'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:43'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:00'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:20'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:52'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:46:17'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:36'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:55'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:20'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:38'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:10'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:46'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:50:56'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 6/30/2021 16:05:43'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North).
		].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'LL 7/1/2021 00:42:36'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (marsRover isAt: aFinalPosition heading: aFinalCardinalPoint)! !


!classDefinition: #TestMarsRoverTracingDevices category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRoverTracingDevices
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRoverTracingDevices methodsFor: 'tests' stamp: 'EF 7/22/2021 11:13:21'!
test01PositionLogDoesNotHaveAnyLogIfNoCommandIsProcessed

	| log marsRover |
	marsRover := MarsRover startingAt: 1@1 heading: #North.
	
	log := MarsRoverLog new.
	marsRover addPositionObserver: log.
	
	marsRover processCommands: ''.
	
	self assert: log isEmpty! !

!TestMarsRoverTracingDevices methodsFor: 'tests' stamp: 'EF 7/22/2021 11:13:21'!
test02PositionLogUpdatesWhenPositionChanges

	| log marsRover |
	marsRover := MarsRover startingAt: 1@1 heading: #North.
	
	log := MarsRoverLog new.
	marsRover addPositionObserver: log.
	
	marsRover processCommands: 'f'.
	
	self deny: log isEmpty.
	self assert: '1@2' equals: log first! !

!TestMarsRoverTracingDevices methodsFor: 'tests' stamp: 'EF 7/22/2021 11:12:48'!
test03HeadingLogUpdatesWhenHeadingChanges

	| log marsRover |
	marsRover := MarsRover startingAt: 1@1 heading: #North.
	
	log := MarsRoverLog new.
	marsRover addHeadingObserver: log.
	
	marsRover processCommands: 'l'.
	
	self deny: log isEmpty.
	self assert: 'Oeste' equals: log first! !

!TestMarsRoverTracingDevices methodsFor: 'tests' stamp: 'EF 7/22/2021 11:13:38'!
test04PositionWindowHasEmptyTextFieldIfNoCommandIsProcessed

	| marsRover window |
	marsRover := MarsRover startingAt: 1@1 heading: #North.
	
	window := MarsRoverStatusWindow new.
	marsRover addPositionObserver: window.
	
	marsRover processCommands: ''.
	
	self assert: window positionTextField isEmpty.! !

!TestMarsRoverTracingDevices methodsFor: 'tests' stamp: 'EF 7/22/2021 11:13:36'!
test05PositionWindowUpdatesWhenPositionChanges

	| marsRover window |
	marsRover := MarsRover startingAt: 1@1 heading: #North.
	
	window := MarsRoverStatusWindow new.
	marsRover addPositionObserver: window.
	
	marsRover processCommands: 'f'.
	
	self assert: 'Posicion: 1@2' equals: window positionTextField! !

!TestMarsRoverTracingDevices methodsFor: 'tests' stamp: 'EF 7/22/2021 11:13:09'!
test06HeadingWindowUpdatesWhenHeadingChanges

	| marsRover window |
	marsRover := MarsRover startingAt: 1@1 heading: #North.
	
	window := MarsRoverStatusWindow new.
	marsRover addHeadingObserver: window.
	
	marsRover processCommands: 'l'.
	
	self assert: 'Mirando al Oeste' equals: window headingTextField! !

!TestMarsRoverTracingDevices methodsFor: 'tests' stamp: 'EF 7/22/2021 11:13:33'!
test07AWindowCanUpdateManyTextFields

	| marsRover window |
	marsRover := MarsRover startingAt: 1@1 heading: #North.
	
	window := MarsRoverStatusWindow new.
	marsRover addHeadingObserver: window.
	marsRover addPositionObserver: window.
	
	marsRover processCommands: 'fl'.
	
	self assert: 'Posicion: 1@2' equals: window positionTextField.
	self assert: 'Mirando al Oeste' equals: window headingTextField! !


!classDefinition: #MarsRover category: 'MarsRover-Solucion'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRover methodsFor: 'initialization' stamp: 'EF 7/1/2021 13:24:43'!
initializeIn: aPosition facing: anOrientation 
	
	position := aPosition.
	orientation := anOrientation! !

!MarsRover methodsFor: 'initialization' stamp: 'EF 7/22/2021 18:30:04'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := TraceableParameter for: aPosition notifyingObserversWith: #positionChangedTo:.
	head := TraceableParameter for: (MarsRoverHead of: self facing: aCardinalPoint) notifyingObserversWith: #headingChangedTo:
	
	! !


!MarsRover methodsFor: 'executing' stamp: 'EF 6/29/2021 11:18:29'!
execute: commandCharacters
	
	commandCharacters do: [ :aCommandCharacter | self processCommandCharacter: aCommandCharacter ].! !


!MarsRover methodsFor: 'testing' stamp: 'EF 6/29/2021 10:39:57'!
isAt: aPosition

	^position = aPosition! !

!MarsRover methodsFor: 'testing' stamp: 'LL 6/30/2021 19:47:14'!
isAt: aPosition heading: aCardinalPoint

	^ position = aPosition and: [ head isHeading: aCardinalPoint ]! !

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


!MarsRover methodsFor: 'process commands' stamp: 'LL 6/30/2021 15:54:14'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 19:48:47'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ head movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ head movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ head rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ head rotateLeft ].
! !


!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:42'!
isBackwardCommand: command

	^ command = $b! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:27'!
isForwardCommand: command

	^ command = $f! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:51:21'!
isInvalidCommand: aCommand
	^(self isForwardCommand: aCommand) not and: 
		[ (self isBackwardCommand: aCommand) not and: 
			[ (self isRotateRightCommand: aCommand) not and: 
				[ (self isRotateLeftCommand: aCommand) not ] ] ]! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:50:53'!
isRotateLeftCommand: command

	^ command = $l! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:27:33'!
isRotateRightCommand: command

	^ command = $r! !


!MarsRover methodsFor: 'dd - moving' stamp: 'EF 7/19/2021 21:28:32'!
moveDown
	
	self step: 0@-1
	! !

!MarsRover methodsFor: 'dd - moving' stamp: 'EF 7/19/2021 21:29:07'!
moveLeft

	self step: -1@0! !

!MarsRover methodsFor: 'dd - moving' stamp: 'EF 7/19/2021 21:29:20'!
moveRight
	
	self step: 1@0
! !

!MarsRover methodsFor: 'dd - moving' stamp: 'EF 7/19/2021 21:29:36'!
moveUp
	
	self step: 0@1! !

!MarsRover methodsFor: 'dd - moving' stamp: 'EF 7/22/2021 18:07:56'!
step: aPositionToAdd
	
	position value: position + aPositionToAdd! !


!MarsRover methodsFor: 'dd - heading' stamp: 'EF 7/22/2021 18:07:56'!
headEast

	head value: (MarsRoverHeadFacingEast of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'EF 7/22/2021 18:07:56'!
headNorth

	head value: (MarsRoverHeadFacingNorth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'EF 7/22/2021 18:07:56'!
headSouth

	head value: (MarsRoverHeadFacingSouth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'EF 7/22/2021 18:07:56'!
headWest

	head value: (MarsRoverHeadFacingWest of: self).! !


!MarsRover methodsFor: 'parameter observing' stamp: 'EF 7/22/2021 11:12:48'!
addHeadingObserver: aMarsRoverLog 
	
	head attach: aMarsRoverLog! !

!MarsRover methodsFor: 'parameter observing' stamp: 'EF 7/22/2021 11:13:21'!
addPositionObserver: aMarsRoverLog 

	position attach: aMarsRoverLog ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Solucion'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'EF 7/1/2021 14:03:45'!
at: aPosition facing: anOrientation
	
	^self new initializeIn: aPosition facing: anOrientation.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


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


!classDefinition: #MarsRoverHead category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:43'!
rotateRight

	self subclassResponsibility! !


!MarsRoverHead methodsFor: 'visitor protocol' stamp: 'EF 7/19/2021 23:41:36'!
accept

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRover-Solucion'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 16:16:27'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 19:46:37'!
of: aMarsRover facing: aCardinalPoint
	
	| headingSubclass |
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalPoint ].
	
	^headingSubclass of: aMarsRover.! !


!classDefinition: #MarsRoverHeadFacingEast category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !


!MarsRoverHeadFacingEast methodsFor: 'visitor protocol' stamp: 'EF 7/19/2021 23:42:25'!
accept: aMarsRoverHeadVisitor

	aMarsRoverHeadVisitor visitingMarsRoverHeadFacingEast! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !


!MarsRoverHeadFacingNorth methodsFor: 'visitor protocol' stamp: 'EF 7/19/2021 23:42:34'!
accept: aMarsRoverHeadVisitor

	aMarsRoverHeadVisitor visitingMarsRoverHeadFacingNorth! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !


!MarsRoverHeadFacingSouth methodsFor: 'visitor protocol' stamp: 'EF 7/19/2021 23:42:40'!
accept: aMarsRoverHeadVisitor

	aMarsRoverHeadVisitor visitingMarsRoverHeadFacingSouth! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !


!MarsRoverHeadFacingWest methodsFor: 'visitor protocol' stamp: 'EF 7/19/2021 23:42:46'!
accept: aMarsRoverHeadVisitor

	aMarsRoverHeadVisitor visitingMarsRoverHeadFacingWest! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoverLog category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverLog
	instanceVariableNames: 'entries'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverLog methodsFor: 'visitor protocol' stamp: 'EF 7/19/2021 23:43:34'!
visitingMarsRoverHeadFacingEast
	
	entries add: 'Este'! !

!MarsRoverLog methodsFor: 'visitor protocol' stamp: 'EF 7/19/2021 23:43:42'!
visitingMarsRoverHeadFacingNorth
	
	entries add: 'Norte'! !

!MarsRoverLog methodsFor: 'visitor protocol' stamp: 'EF 7/19/2021 23:43:49'!
visitingMarsRoverHeadFacingSouth
	
	entries add: 'Sur'! !

!MarsRoverLog methodsFor: 'visitor protocol' stamp: 'EF 7/19/2021 23:43:58'!
visitingMarsRoverHeadFacingWest
	
	entries add: 'Oeste'! !


!MarsRoverLog methodsFor: 'observer protocol' stamp: 'EF 7/22/2021 11:19:36'!
headingChangedTo: aMarsRoverHead

	aMarsRoverHead accept: self
	
	! !

!MarsRoverLog methodsFor: 'observer protocol' stamp: 'EF 7/22/2021 18:29:53'!
positionChangedTo: aPosition

	entries add: aPosition asString! !


!MarsRoverLog methodsFor: 'testing' stamp: 'EF 7/19/2021 20:44:14'!
first

	^entries first! !

!MarsRoverLog methodsFor: 'testing' stamp: 'EF 7/19/2021 20:41:00'!
isEmpty

	^entries isEmpty! !


!MarsRoverLog methodsFor: 'initialization' stamp: 'EF 7/19/2021 20:39:51'!
initialize

	entries := OrderedCollection new.! !


!classDefinition: #MarsRoverStatusWindow category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverStatusWindow
	instanceVariableNames: 'positionTextField headingTextField'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverStatusWindow methodsFor: 'observer protocol' stamp: 'EF 7/22/2021 11:31:30'!
headingChangedTo: aMarsRoverHead

	aMarsRoverHead accept: self! !

!MarsRoverStatusWindow methodsFor: 'observer protocol' stamp: 'EF 7/21/2021 23:31:01'!
positionChangedTo: aPosition

	positionTextField := 'Posicion: ', aPosition asString! !


!MarsRoverStatusWindow methodsFor: 'initialization' stamp: 'EF 7/19/2021 21:10:12'!
initialize

	positionTextField := ''! !


!MarsRoverStatusWindow methodsFor: 'text fields' stamp: 'EF 7/19/2021 21:15:52'!
headingTextField
	
	^headingTextField! !

!MarsRoverStatusWindow methodsFor: 'text fields' stamp: 'EF 7/19/2021 21:07:05'!
positionTextField
	
	^positionTextField! !


!MarsRoverStatusWindow methodsFor: 'visitor protocol' stamp: 'EF 7/19/2021 23:43:34'!
visitingMarsRoverHeadFacingEast
	
	headingTextField := 'Mirando al Este'! !

!MarsRoverStatusWindow methodsFor: 'visitor protocol' stamp: 'EF 7/19/2021 23:43:42'!
visitingMarsRoverHeadFacingNorth
	
	headingTextField := 'Mirando al Norte'! !

!MarsRoverStatusWindow methodsFor: 'visitor protocol' stamp: 'EF 7/19/2021 23:43:49'!
visitingMarsRoverHeadFacingSouth
	
	headingTextField := 'Mirando al Sur'! !

!MarsRoverStatusWindow methodsFor: 'visitor protocol' stamp: 'EF 7/19/2021 23:43:58'!
visitingMarsRoverHeadFacingWest
	
	headingTextField := 'Mirando al Oeste'! !


!classDefinition: #TraceableParameter category: 'MarsRover-Solucion'!
ProtoObject subclass: #TraceableParameter
	instanceVariableNames: 'parameter observers observerNotificationMessage'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TraceableParameter methodsFor: 'observer protocol' stamp: 'EF 7/22/2021 10:46:51'!
attach: anObserver

	observers add: anObserver ! !

!TraceableParameter methodsFor: 'observer protocol' stamp: 'EF 7/22/2021 18:27:33'!
notify

	observers do: [ :anObserver | observerNotificationMessage sendTo: anObserver with: self ]! !


!TraceableParameter methodsFor: 'does not understand' stamp: 'EF 7/22/2021 10:47:52'!
doesNotUnderstand: aMessage

	^aMessage sendTo: parameter ! !


!TraceableParameter methodsFor: 'initialization' stamp: 'EF 7/22/2021 18:27:07'!
initializeFor: aParameter notifyingObserversWith: anObserverNotificationMessage

	parameter := aParameter.
	observers := OrderedCollection new.
	observerNotificationMessage := anObserverNotificationMessage ! !


!TraceableParameter methodsFor: 'value' stamp: 'EF 7/22/2021 18:07:56'!
value: aNewParameter

	parameter := aNewParameter.
	self notify! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TraceableParameter class' category: 'MarsRover-Solucion'!
TraceableParameter class
	instanceVariableNames: ''!

!TraceableParameter class methodsFor: 'instance creation' stamp: 'EF 7/22/2021 18:28:52'!
for: aParameter notifyingObserversWith: anObserverNotificationMessage

	^self new initializeFor: aParameter notifyingObserversWith: anObserverNotificationMessage
! !
