!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'EF 5/13/2021 23:26:21'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self assertSingleBookModification: [customerBook addCustomerNamed: 'John Lennon'.] shouldNotTakeMoreThan: 50 * millisecond.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'EF 5/13/2021 23:26:49'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self assertSingleBookModification: [customerBook removeCustomerNamed: paulMcCartney.] shouldNotTakeMoreThan: 100 * millisecond.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'EF 5/15/2021 17:46:47'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'HAW 8/28/2017 08:57:25'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'EF 5/15/2021 19:51:46'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertCustomerBook: customerBook hasSuspendedCustomers: 1 andActiveCustomers: 0 andTotalCustomers: 1.
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'EF 5/15/2021 19:53:27'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	
	
	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertCustomerBook: customerBook hasSuspendedCustomers: 0 andActiveCustomers: 0 andTotalCustomers: 0.
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'EF 5/14/2021 02:37:00'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon ringoStarr |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	ringoStarr := 'Ringo Starr'.
	
	self assertCannotSuspend: ringoStarr fromCustomerBook:  customerBook andIncludes: johnLennon.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'EF 5/14/2021 02:37:00'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self assertCannotSuspend: johnLennon fromCustomerBook: customerBook andIncludes: johnLennon.
! !


!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'EF 5/15/2021 19:37:41'!
addAndSuspendCustomer: customerToAddAndSuspend inCustomerBook:  customerBook andThenPerformAction: actionThatIsPerformedAfterAddingAndSuspendingTheCustomer

	customerBook addCustomerNamed: customerToAddAndSuspend.
	customerBook suspendCustomerNamed: customerToAddAndSuspend.
	actionThatIsPerformedAfterAddingAndSuspendingTheCustomer value.! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'EF 5/15/2021 19:36:43'!
addAndSuspendCustomer: customerToAddAndSuspend inCustomerBook:  customerBook zzzzz: actionThatIsPerformedAfterAddingAndSuspendingTheCustomer

	customerBook addCustomerNamed: customerToAddAndSuspend.
	customerBook suspendCustomerNamed: customerToAddAndSuspend.
	actionThatIsPerformedAfterAddingAndSuspendingTheCustomer value.! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'EF 5/15/2021 18:44:52'!
assertCannotSuspend: customerThatCanNotBeSuspended fromCustomerBook: customerBook andIncludes: includedCustomer

	| previousNumberOfCustomers |
	
	previousNumberOfCustomers := customerBook numberOfCustomers.
	
	[ customerBook suspendCustomerNamed: customerThatCanNotBeSuspended.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = previousNumberOfCustomers.
			self assert: (customerBook includesCustomerNamed: includedCustomer) ]! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'EF 5/15/2021 19:18:37'!
assertCustomerBook: customerBook hasSuspendedCustomers: expectedNumberOfSuspendedCustomers andActiveCustomers: expectedNumberOfActiveCustomers andTotalCustomers: expectedNumberOfTotalCustomers

	self assert: expectedNumberOfActiveCustomers equals: customerBook numberOfActiveCustomers.
	self assert: expectedNumberOfSuspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: expectedNumberOfTotalCustomers equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'EF 5/13/2021 23:24:10'!
assertSingleBookModification: bookModification shouldNotTakeMoreThan: expectedMaxTimeDuration

	|millisecondsBeforeChange millisecondsAfterChange|
	
	
	millisecondsBeforeChange := Time millisecondClockValue * millisecond.
	bookModification value.
	millisecondsAfterChange := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterChange-millisecondsBeforeChange) < expectedMaxTimeDuration
	
! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'EF 5/15/2021 19:34:18'!
xxxx: customerBook yyyyy: customerToAddAndSuspend zzzzz: actionThatIsPerformedAfterAddingAndSuspendingTheCustomer

	customerBook addCustomerNamed: customerToAddAndSuspend.
	customerBook suspendCustomerNamed: customerToAddAndSuspend.
	actionThatIsPerformedAfterAddingAndSuspendingTheCustomer value.! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'EF 5/15/2021 19:32:57'!
xxxxx: customerBook yyyyy: customerToAddAndSuspend zzzzz: actionThatIsPerformedAfterAddingAndSuspendingTheCustomer

	customerBook addCustomerNamed: customerToAddAndSuspend.
	customerBook suspendCustomerNamed: customerToAddAndSuspend.
	actionThatIsPerformedAfterAddingAndSuspendingTheCustomer value.! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'EF 5/15/2021 19:48:08'!
_test05Alternativa

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	"Decidimos no agregar este mensaje porque, si bien reduce lineas de codigo, no mejora la legibilidad
	del mismo"
	self addAndSuspendCustomer: paulMcCartney inCustomerBook: customerBook andThenPerformAction: [].
	
	self assertCustomerBook: customerBook hasSuspendedCustomers: 1 andActiveCustomers: 1 andTotalCustomers: 0.
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'EF 5/15/2021 19:47:17'!
_test06Alternativa
	
	
	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	"Decidimos no agregar este mensaje porque, si bien reduce lineas de codigo, no mejora la legibilidad
	del mismo"
	self addAndSuspendCustomer: paulMcCartney inCustomerBook: customerBook andThenPerformAction: [customerBook removeCustomerNamed: paulMcCartney.].
	
	self assertCustomerBook: customerBook hasSuspendedCustomers: 1 andActiveCustomers: 1 andTotalCustomers: 0.
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'EF 5/15/2021 16:00:21'!
addCustomerNamed: aName
	
	self checkNewCustomerNameCannotBeEmpty: aName.
	self checkNewCustomerNameCannotExistPreviously: aName.
		
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'EF 5/14/2021 02:21:55'!
removeCustomerNamed: aName 
 	
	active remove: aName ifAbsent: [
		suspended remove: aName ifAbsent: [
			^ NotFound signal.
			]
		].
! !

!CustomerBook methodsFor: 'customer management' stamp: 'EF 5/15/2021 16:37:57'!
suspendCustomerNamed: aName 
	
	self checkCannotSuspendNotActiveCustomer: aName.
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'EF 5/15/2021 18:20:14'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !


!CustomerBook methodsFor: 'as yet unclassified' stamp: 'EF 5/15/2021 16:38:14'!
checkCannotSuspendNotActiveCustomer: aName
	(active includes: aName) ifFalse: [^CantSuspend signal].! !

!CustomerBook methodsFor: 'as yet unclassified' stamp: 'EF 5/14/2021 02:31:31'!
checkNewCustomerNameCannotBeEmpty: aName
	
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].! !

!CustomerBook methodsFor: 'as yet unclassified' stamp: 'EF 5/15/2021 16:01:37'!
checkNewCustomerNameCannotExistPreviously: aName

	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
