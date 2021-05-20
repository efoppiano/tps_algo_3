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
	instanceVariableNames: 'customerBook johnLennon paulMcCartney ringoStarr'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'EF 5/18/2021 12:44:41'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	self assertExecutingClosure: [customerBook addCustomerNamed: johnLennon.] shouldNotTakeMoreThan: 50 * millisecond.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'EF 5/18/2021 12:44:50'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	customerBook addCustomerNamed: paulMcCartney.
	
	self assertExecutingClosure: [customerBook removeCustomerNamed: paulMcCartney.] shouldNotTakeMoreThan: 100 * millisecond.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'EF 5/18/2021 12:44:55'!
test03CanNotAddACustomerWithEmptyName 

	self assertExecutingClosure: [customerBook addCustomerNamed: ''.] throwsError: Error andVerifies: [
		:anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty].
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'EF 5/18/2021 12:45:04'!
test04CanNotRemoveAnInvalidCustomer

	customerBook addCustomerNamed: johnLennon.
	
	self assertExecutingClosure: [customerBook removeCustomerNamed: paulMcCartney.] throwsError: NotFound andVerifies: [
		:anError | 
		self assert: customerBook numberOfCustomers = 1.
		self assert: (customerBook includesCustomerNamed: johnLennon)
		].
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'EF 5/18/2021 12:45:09'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertCustomerBookHasSuspendedCustomers: 1 andActiveCustomers: 0 andTotalCustomers: 1.
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'EF 5/18/2021 12:45:19'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertCustomerBookHasSuspendedCustomers: 0 andActiveCustomers: 0 andTotalCustomers: 0.
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'EF 5/18/2021 13:01:02'!
test07CanNotSuspendAnInvalidCustomer

	customerBook addCustomerNamed: johnLennon.

	self assertCannotSuspend: ringoStarr fromCustomerBookAndIncludesCustomer: johnLennon andHasTotalCustomers: 1.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'EF 5/18/2021 13:01:02'!
test08CanNotSuspendAnAlreadySuspendedCustomer

	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self assertCannotSuspend: johnLennon fromCustomerBookAndIncludesCustomer: johnLennon andHasTotalCustomers: 1.! !


!CustomerBookTest methodsFor: 'discardedMethods' stamp: 'EF 5/18/2021 13:00:18'!
addAndSuspendCustomer: customerToAddAndSuspend fromCustomerBookAndThenPerformAction: actionPerformedAfterAddingAndSuspendingTheCustomer
	
	"Decidimos no agregar este mensaje porque, si bien reduce lineas de codigo, no mejora la legibilidad
	del mismo"
	customerBook addCustomerNamed: customerToAddAndSuspend.
	customerBook suspendCustomerNamed: customerToAddAndSuspend.
	actionPerformedAfterAddingAndSuspendingTheCustomer value.! !

!CustomerBookTest methodsFor: 'discardedMethods' stamp: 'EF 5/18/2021 12:59:57'!
_test05Alternativa
	
	self addAndSuspendCustomer: paulMcCartney fromCustomerBookAndThenPerformAction: [].
	
	self assertCustomerBookHasSuspendedCustomers: 1 andActiveCustomers: 1 andTotalCustomers: 0.
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	! !

!CustomerBookTest methodsFor: 'discardedMethods' stamp: 'EF 5/18/2021 13:00:05'!
_test06Alternativa
	
	self addAndSuspendCustomer: paulMcCartney fromCustomerBookAndThenPerformAction: [customerBook removeCustomerNamed: paulMcCartney.].
	
	self assertCustomerBookHasSuspendedCustomers: 1 andActiveCustomers: 1 andTotalCustomers: 0.
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !


!CustomerBookTest methodsFor: 'assertions' stamp: 'EF 5/18/2021 13:01:02'!
assertCannotSuspend: customerThatCanNotBeSuspended fromCustomerBookAndIncludesCustomer: includedCustomer andHasTotalCustomers: expectedNumberOfTotalCustomers
	
	"Si bien el colaborador que recibe como 'includedCustomer' no varia en los tests
	en que se utiliza este mensaje (test07 y test08), lo agregamos porque consideramos
	que mejora la legibilidad del mensaje en el codigo de los tests"
	
	self assertExecutingClosure: [customerBook suspendCustomerNamed: customerThatCanNotBeSuspended ] throwsError: CantSuspend andVerifies: [
		:anError | 
			self assert: customerBook numberOfCustomers = expectedNumberOfTotalCustomers.
			self assert: (customerBook includesCustomerNamed: includedCustomer)
		]! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'EF 5/18/2021 12:43:54'!
assertCustomerBookHasSuspendedCustomers: expectedNumberOfSuspendedCustomers andActiveCustomers: expectedNumberOfActiveCustomers andTotalCustomers: expectedNumberOfTotalCustomers

	self assert: expectedNumberOfActiveCustomers equals: customerBook numberOfActiveCustomers.
	self assert: expectedNumberOfSuspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: expectedNumberOfTotalCustomers equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'EF 5/20/2021 13:40:30'!
assertExecutingClosure: blockClosureToRun shouldNotTakeMoreThan: expectedMaxTimeDuration
	
	| timeToRunBlockClosure |
	timeToRunBlockClosure := blockClosureToRun timeToRun * millisecond.
	
	self assert: timeToRunBlockClosure < expectedMaxTimeDuration
	
! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'EF 5/17/2021 20:06:40'!
assertExecutingClosure: blockClosureToRun throwsError: errorName andVerifies: verificationsThatMustVerifyAfterError

	[ blockClosureToRun value.
	self fail ]
		on: errorName 
		do: verificationsThatMustVerifyAfterError! !


!CustomerBookTest methodsFor: 'initialization' stamp: 'EF 5/20/2021 13:52:18'!
setUp

	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	paulMcCartney := 'Paul McCartney'.
	ringoStarr := 'Ringo Starr'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBookTest class' category: 'CodigoRepetido-Ejercicio'!
CustomerBookTest class
	instanceVariableNames: 'johnLennon customerBook paulMcCartney'!


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

!CustomerBook methodsFor: 'customer management' stamp: 'EF 5/16/2021 22:57:57'!
suspendCustomerNamed: aName 
	
	active remove: aName ifAbsent: [^CantSuspend signal].
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'EF 5/16/2021 22:54:03'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'EF 5/18/2021 12:23:26'!
isEmpty
	
	^self numberOfCustomers = 0! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !


!CustomerBook methodsFor: 'checks' stamp: 'EF 5/14/2021 02:31:31'!
checkNewCustomerNameCannotBeEmpty: aName
	
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].! !

!CustomerBook methodsFor: 'checks' stamp: 'EF 5/15/2021 16:01:37'!
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
