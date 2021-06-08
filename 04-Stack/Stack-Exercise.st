!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'EF 6/3/2021 22:44:26'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'EF 6/4/2021 02:20:58'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'emptyStack oneElementStack threeElementsStack multipleMatchesStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'initialization' stamp: 'EF 6/8/2021 03:09:26'!
setUp

	emptyStack := OOStack new.
	oneElementStack := OOStack new.
	threeElementsStack := OOStack new.
	multipleMatchesStack := OOStack new.
	
	oneElementStack push: 'Algoritmos III Leveroni'.
	threeElementsStack push: 'cielo parcialmente nublado'.
	threeElementsStack push: 'El parcial es el 7 de junio'.
	threeElementsStack push: 'Todos los hombres son mortales'.
	multipleMatchesStack push: 'El auto es rojo'.
	multipleMatchesStack push: 'Todos los dias'.
	multipleMatchesStack push: 'El camion es azul'.
	multipleMatchesStack push: 'El cielo es azul'.! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'EF 6/8/2021 10:09:06'!
test01PrefixCanNotBeEmpty
	
	"
	No testeamos el mensaje #beginsWith porque consideramos que
	ya se encuentra testeado por SmallTalk y funciona correctamente
	"
	
	self
		should: [SentenceFinderByPrefix withPrefix: '' andStack: threeElementsStack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix emptyPrefixErrorDescription ]. 
		

	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'EF 6/8/2021 02:54:16'!
test02PrefixCanNotContainSpaces
	
	self
		should: [SentenceFinderByPrefix withPrefix: 'al ' andStack: threeElementsStack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix spacesInPrefixErrorDescription ]. 
		

	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'EF 6/8/2021 02:58:39'!
test03SentenceFinderShouldNotFailWithEmptyStack

	| sentenceFinder |
	sentenceFinder := SentenceFinderByPrefix withPrefix: 'a' andStack: emptyStack.
	
	self assert: sentenceFinder find isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'EF 6/8/2021 03:05:26'!
test04SentenceFinderFindsInStackWithOneElement

	| sentenceFinder foundSentences|
	sentenceFinder := SentenceFinderByPrefix withPrefix: 'Algoritmos' andStack: oneElementStack.
	foundSentences := sentenceFinder find.
	
	self assert: 1 equals: foundSentences size.
	self assert: foundSentences includes: 'Algoritmos III Leveroni'.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'EF 6/8/2021 03:06:53'!
test05SentenceFinderFindsInStackWithManyElements

	| sentenceFinder foundSentences|
	sentenceFinder := SentenceFinderByPrefix withPrefix: 'Todos' andStack: threeElementsStack.
	foundSentences := sentenceFinder find.
	
	self assert: 1 equals: foundSentences size.
	self assert: foundSentences includes: 'Todos los hombres son mortales'.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'EF 6/8/2021 03:18:15'!
test06SentenceFinderFindsMultipleMatches

	| sentenceFinder foundSentences|
	sentenceFinder := SentenceFinderByPrefix withPrefix: 'El' andStack: multipleMatchesStack.
	foundSentences := sentenceFinder find.
	
	self assert: 3 equals: foundSentences size.
	self assert: foundSentences includes: 'El auto es rojo'.
	self assert: foundSentences includes: 'El camion es azul'.
	self assert: foundSentences includes: 'El cielo es azul'.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'EF 6/8/2021 03:23:29'!
test07SentenceFinderPreservesStackOrder

	| sentenceFinder |
	sentenceFinder := SentenceFinderByPrefix withPrefix: 'El' andStack: threeElementsStack .
	sentenceFinder find.
	
	self assert: 'Todos los hombres son mortales' equals: threeElementsStack pop.
	self assert: 'El parcial es el 7 de junio' equals: threeElementsStack pop.
	self assert: 'cielo parcialmente nublado' equals: threeElementsStack pop.
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'EF 6/8/2021 09:56:49'!
test08SentenceFinderShouldNotFailWhenNotFindingAnyMatchingSentence

	| sentenceFinder foundSentences |
	
	sentenceFinder := SentenceFinderByPrefix withPrefix: 'En' andStack: threeElementsStack.
	foundSentences := sentenceFinder find.
	
	self assert: 0 equals: foundSentences size.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topPlate size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'checks' stamp: 'EF 6/7/2021 22:58:05'!
isEmpty

	^self size = 0! !


!OOStack methodsFor: 'accessing' stamp: 'EF 6/8/2021 10:22:03'!
pop
	
	| lastPushedContent |
	lastPushedContent := self top.
	topPlate := topPlate lowerPlate.
	^lastPushedContent.
	! !

!OOStack methodsFor: 'accessing' stamp: 'EF 6/8/2021 10:24:19'!
push: aContent
	
	| newTopPlate |
	newTopPlate := StackRemovablePlate withContent: aContent overPlate: topPlate.
	
	topPlate := newTopPlate.! !

!OOStack methodsFor: 'accessing' stamp: 'EF 6/8/2021 10:11:35'!
size
	^topPlate platesUntilBase.! !

!OOStack methodsFor: 'accessing' stamp: 'EF 6/7/2021 20:54:17'!
top
	^topPlate content.! !


!OOStack methodsFor: 'initialization' stamp: 'EF 6/8/2021 10:15:35'!
initialize

	topPlate := StackBasePlate new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'prefix stackOfSentences reversedStackOfSentences foundSentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'finding' stamp: 'EF 6/8/2021 00:17:06'!
find
		
	self findSentencesByPrefix.
	self restoreStackOrder.
	^foundSentences.! !


!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'EF 6/8/2021 00:20:22'!
addSentenceIfMatchesPrefix: analyzedSentence
	
	(analyzedSentence beginsWith: prefix) ifTrue: [
			foundSentences addFirst: analyzedSentence].! !

!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'EF 6/8/2021 10:02:29'!
findSentencesByPrefix
	
	| analyzedSentence |
	
	stackOfSentences size timesRepeat: [
		analyzedSentence := stackOfSentences pop.
		self addSentenceIfMatchesPrefix: analyzedSentence.
		reversedStackOfSentences push: analyzedSentence.
		].! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'EF 6/8/2021 03:00:47'!
initializeWithPrefix: aPrefix andStack: aStack
	
	prefix := aPrefix.
	stackOfSentences := aStack.
	reversedStackOfSentences := OOStack new.
	foundSentences := OrderedCollection new.! !


!SentenceFinderByPrefix methodsFor: 'restoration - private' stamp: 'EF 6/8/2021 10:03:15'!
restoreStackOrder

	reversedStackOfSentences size timesRepeat: [
		stackOfSentences push: reversedStackOfSentences pop.].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'EF 6/7/2021 23:48:17'!
assertPrefixCanNotBeEmpty: aPrefix
	
	aPrefix = '' ifTrue: [ self error: self emptyPrefixErrorDescription ].! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'EF 6/8/2021 02:49:42'!
assertPrefixCanNotContainSpaces: aPrefix

	(self includesSpaces: aPrefix) ifTrue: [self error: self spacesInPrefixErrorDescription ].
! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'EF 6/7/2021 22:55:27'!
emptyPrefixErrorDescription
	^'Prefix can not be empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'EF 6/8/2021 02:54:03'!
includesSpaces: aPrefix

	^(aPrefix findString: ' ') > 0.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'EF 6/8/2021 00:28:16'!
spacesInPrefixErrorDescription
	^'Prefix can not contain spaces'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'EF 6/7/2021 23:48:50'!
withPrefix: aPrefix andStack: aStack
	
	self assertPrefixCanNotBeEmpty: aPrefix.
	self assertPrefixCanNotContainSpaces: aPrefix.
	
	^SentenceFinderByPrefix new initializeWithPrefix: aPrefix andStack: aStack.! !


!classDefinition: #StackPlate category: 'Stack-Exercise'!
Object subclass: #StackPlate
	instanceVariableNames: 'content lowerPlate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackPlate methodsFor: 'accessing' stamp: 'EF 6/7/2021 20:55:38'!
content
	self subclassResponsibility ! !

!StackPlate methodsFor: 'accessing' stamp: 'EF 6/7/2021 15:44:12'!
lowerPlate
	self subclassResponsibility.! !


!StackPlate methodsFor: 'counting' stamp: 'EF 6/8/2021 10:11:35'!
platesUntilBase
	self subclassResponsibility.! !


!classDefinition: #StackBasePlate category: 'Stack-Exercise'!
StackPlate subclass: #StackBasePlate
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackBasePlate methodsFor: 'counting' stamp: 'EF 6/8/2021 10:11:35'!
platesUntilBase
	
	^0.! !


!StackBasePlate methodsFor: 'accessing' stamp: 'EF 6/7/2021 20:54:17'!
content
	self error: OOStack stackEmptyErrorDescription.! !

!StackBasePlate methodsFor: 'accessing' stamp: 'EF 6/7/2021 19:58:30'!
lowerPlate
	^self.! !


!classDefinition: #StackRemovablePlate category: 'Stack-Exercise'!
StackPlate subclass: #StackRemovablePlate
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackRemovablePlate methodsFor: 'accessing' stamp: 'EF 6/7/2021 20:54:41'!
content
	^content.! !

!StackRemovablePlate methodsFor: 'accessing' stamp: 'EF 6/7/2021 15:46:27'!
lowerPlate
	^lowerPlate.! !


!StackRemovablePlate methodsFor: 'counting' stamp: 'EF 6/8/2021 10:11:35'!
platesUntilBase
	
	^1 + lowerPlate platesUntilBase.! !


!StackRemovablePlate methodsFor: 'initialization' stamp: 'EF 6/7/2021 20:56:14'!
initializeWithContent: aContent overPlate: aLowerPlate

	content := aContent.
	lowerPlate := aLowerPlate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackRemovablePlate class' category: 'Stack-Exercise'!
StackRemovablePlate class
	instanceVariableNames: ''!

!StackRemovablePlate class methodsFor: 'as yet unclassified' stamp: 'EF 6/8/2021 10:14:37'!
withContent: aValue overPlate: aLowerPlate
	
	^self new initializeWithContent: aValue overPlate: aLowerPlate! !
