!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'anEmptyPortfolio aFirstAccount aPortfolioWithAFirstAccount aFirstDeposit aSecondAccount aSecondDeposit aPortfolioWithASecondAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'setUp' stamp: 'EF 7/8/2021 13:55:04'!
setUp

	anEmptyPortfolio := Portfolio new.
	
	aFirstAccount := ReceptiveAccount new.
	aPortfolioWithAFirstAccount := Portfolio with: aFirstAccount.
	aFirstDeposit := Deposit register: 10*peso on: aFirstAccount.
	
	aSecondAccount := ReceptiveAccount new.
	aPortfolioWithASecondAccount := Portfolio with: aSecondAccount.
	aSecondDeposit := Deposit register: 30*peso on: aSecondAccount.
! !


!PortfolioTest methodsFor: 'tests' stamp: 'EF 7/8/2021 13:33:04'!
test01EmptyPortfolioHasBalanceZero
	
	self assert: 0*peso equals: anEmptyPortfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'EF 7/8/2021 13:51:08'!
test02PortfolioWithOneAccountKnowsItsBalance
	
	self assert: aFirstAccount balance equals: aPortfolioWithAFirstAccount balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'EF 7/8/2021 16:52:06'!
test03PortfolioWithNestedAccountsKnowsItsBalance
	
	"Al principio también había un test que lo probaba con
	varias ReceptiveAccounts, pero uno de los tests no fallaba al
	crearlo, 	por lo que el caso de test debía ser el mismo.
	Decidí quedarme 	con éste, pues aporta más valor al
	entendimiento del dominio 	del problema"
		
	aPortfolioWithAFirstAccount add: aPortfolioWithASecondAccount.
		
	self assert: aFirstAccount balance + aSecondAccount balance equals: aPortfolioWithAFirstAccount balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'EF 7/8/2021 13:50:14'!
test04PortfolioDoesNotKnowNotRegisteredTransactions
		
	self deny: (anEmptyPortfolio hasRegistered: aFirstDeposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'EF 7/8/2021 13:50:51'!
test05PortfolioWithOneAccountKnowsItsRegisteredTransactions
	
	self assert: (aPortfolioWithAFirstAccount hasRegistered: aFirstDeposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'EF 7/8/2021 14:33:40'!
test06PortfolioWithNestedAccountsKnowsItsTransactions
	
	"Sucedió lo mismo que con el test03"
	
	aPortfolioWithAFirstAccount add: aPortfolioWithASecondAccount.
	
	self assert: (aPortfolioWithAFirstAccount hasRegistered: aFirstDeposit).
	self assert: (aPortfolioWithAFirstAccount hasRegistered: aSecondDeposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'EF 7/8/2021 13:42:12'!
test07EmptyPortfolioDoesNotHaveTransactions

	self assert: anEmptyPortfolio transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'EF 7/8/2021 16:53:20'!
test08PortfolioWithOneAccountKnowsItsTransactions
		
	self deny: aPortfolioWithAFirstAccount transactions isEmpty.
	self assert: (aPortfolioWithAFirstAccount transactions includes: aFirstDeposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'EF 7/8/2021 14:32:40'!
test09PortfolioWithNestedAccountsKnowsItsTransactions
	
	"Sucedió lo mismo que con el test03"
		
	aPortfolioWithAFirstAccount add: aPortfolioWithASecondAccount.

	self assert: (aPortfolioWithAFirstAccount transactions includes: aFirstDeposit).
	self assert: (aPortfolioWithAFirstAccount transactions includes: aSecondDeposit)! !


!classDefinition: #ValidPortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
PortfolioTest subclass: #ValidPortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ValidPortfolioTest methodsFor: 'tests' stamp: 'EF 7/8/2021 13:54:33'!
test01CannotAddTheSameAccountMultipleTimes
	
	self
	should: [ aPortfolioWithAFirstAccount add: aFirstAccount ]
	raise: Error
	withExceptionDo: [ :anError | 
		self assert: Portfolio repeatedAccountErrorMessage equals: anError messageText.
		self assert: 1 equals: aPortfolioWithAFirstAccount bankAccountsSize ]! !

!ValidPortfolioTest methodsFor: 'tests' stamp: 'EF 7/8/2021 16:54:25'!
test02CannotAddAccountIncludedInChildPortfolio

	| portfolio |
	portfolio := Portfolio with: aPortfolioWithAFirstAccount.

	self
	should: [ portfolio add: aFirstAccount ]
	raise: Error
	withExceptionDo: [ :anError | 
		self assert: Portfolio repeatedAccountErrorMessage equals: anError messageText.
		self assert: 1 equals: portfolio bankAccountsSize ]! !

!ValidPortfolioTest methodsFor: 'tests' stamp: 'EF 7/8/2021 13:57:15'!
test03CannotAddToItself

	self
	should: [ anEmptyPortfolio add: anEmptyPortfolio ]
	raise: Error
	withExceptionDo: [ :anError | 
		self assert: Portfolio repeatedAccountErrorMessage equals: anError messageText.
		self assert: 0 equals: anEmptyPortfolio bankAccountsSize ]! !

!ValidPortfolioTest methodsFor: 'tests' stamp: 'EF 7/8/2021 13:58:39'!
test04CannotAddAccountIncludedInParent

	| portfolio |

	portfolio := Portfolio with: anEmptyPortfolio with: aFirstAccount.

	self
	should: [ anEmptyPortfolio add: aFirstAccount ]
	raise: Error
	withExceptionDo: [ :anError | 
		self assert: Portfolio repeatedAccountErrorMessage equals: anError messageText.
		self assert: 0 equals: anEmptyPortfolio bankAccountsSize ]! !

!ValidPortfolioTest methodsFor: 'tests' stamp: 'EF 7/8/2021 13:59:31'!
test05CannotAddAccountIncludedDeeplyInParent

	| portfolio |
	portfolio := Portfolio with: aPortfolioWithAFirstAccount with: anEmptyPortfolio.
	
	self
	should: [ anEmptyPortfolio add: aFirstAccount ]
	raise: Error
	withExceptionDo: [ :anError | 
		self assert: Portfolio repeatedAccountErrorMessage equals: anError messageText.
		self assert: 0 equals: anEmptyPortfolio bankAccountsSize ]! !

!ValidPortfolioTest methodsFor: 'tests' stamp: 'EF 7/8/2021 14:01:16'!
test06CannotAddPortfolioToAnotherWhenBothShareAccounts

	| anotherPortfolioWithAFirstAccount |

	anotherPortfolioWithAFirstAccount := Portfolio with: aFirstAccount.
	
	self
	should: [ aPortfolioWithAFirstAccount add: anotherPortfolioWithAFirstAccount ]
	raise: Error
	withExceptionDo: [ :anError | 
		self assert: Portfolio repeatedAccountErrorMessage equals: anError messageText.
		self assert: 1 equals: aPortfolioWithAFirstAccount bankAccountsSize ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'EF 7/6/2021 21:03:41'!
test08TransferKnowsItsValue

	| depositAccount withdrawAccount transfer |
	
	depositAccount := ReceptiveAccount new.
	withdrawAccount := ReceptiveAccount new.

	Deposit register: 50 * peso on: withdrawAccount.
	transfer := Transfer register: 20*peso from: withdrawAccount to: depositAccount.
	
	self assert: 20*peso equals: transfer value.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'EF 7/6/2021 21:05:17'!
test09TransactionLegsKnowTransactionValue

	| depositAccount withdrawAccount depositLeg transfer withdrawLeg |
	
	depositAccount := ReceptiveAccount new.
	withdrawAccount := ReceptiveAccount new.

	Deposit register: 50 * peso on: withdrawAccount.
	transfer := Transfer register: 20*peso from: withdrawAccount to: depositAccount.
	withdrawLeg := transfer withdrawLeg.
	depositLeg := transfer depositLeg.
	
	self assert: 20*peso equals: withdrawLeg value.
	self assert: 20*peso equals: depositLeg value.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'EF 7/6/2021 21:05:53'!
test10TransferAffectsAccountsBalance

	| depositAccount withdrawAccount |
	
	depositAccount := ReceptiveAccount new.
	withdrawAccount := ReceptiveAccount new.

	Deposit register: 50 * peso on: withdrawAccount.
	Transfer register: 20*peso from: withdrawAccount to: depositAccount.
	
	self assert: 30*peso equals: withdrawAccount balance.
	self assert: 20*peso equals: depositAccount balance.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'EF 7/6/2021 21:06:18'!
test11TransactionLegsKnowTheirCounterpart

	| depositAccount withdrawAccount depositLeg transfer withdrawLeg |
	
	depositAccount := ReceptiveAccount new.
	withdrawAccount := ReceptiveAccount new.

	Deposit register: 50 * peso on: withdrawAccount.
	transfer := Transfer register: 20*peso from: withdrawAccount to: depositAccount.
	withdrawLeg := transfer withdrawLeg.
	depositLeg := transfer depositLeg.
	
	self assert: withdrawLeg equals: depositLeg counterpart.
	self assert: depositLeg equals: withdrawLeg counterpart.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'EF 7/8/2021 14:05:14'!
test12TransferValueShouldBePositive

	| depositAccount withdrawAccount |
	
	depositAccount := ReceptiveAccount new.
	withdrawAccount := ReceptiveAccount new.

	Deposit register: 50 * peso on: withdrawAccount.
	
	self
	should: [ Transfer register: 0*peso from: withdrawAccount to: depositAccount ]
	raise: Error
	withExceptionDo: [ :anError | 
		self assert: Transfer nonPositiveTransferredAmountErrorMessage equals: anError messageText.
		self assert: 50*peso equals: withdrawAccount balance.
		self assert: 0*peso equals: depositAccount balance]! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'EF 7/8/2021 17:32:07'!
test13AccountsInvolvedInTransferShouldBeDifferent

	| account |
	
	account := ReceptiveAccount new.

	Deposit register: 50 * peso on: account.
	
	self
	should: [ Transfer register: 10*peso from: account to: account ]
	raise: Error
	withExceptionDo: [ :anError | 
		self assert: Transfer accountsCannotBeEqualErrorMessage equals: anError messageText.
		self assert: 50*peso equals: account balance.
		self assert: 1 equals: account transactions size ]! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance operations' stamp: 'EF 7/5/2021 23:25:42'!
effectOnBalance: aBalance

	^self subclassResponsibility ! !


!classDefinition: #OneLegTransaction category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #OneLegTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!OneLegTransaction methodsFor: 'value' stamp: 'EF 7/8/2021 15:45:16'!
value

	^value! !


!OneLegTransaction methodsFor: 'initialization' stamp: 'EF 7/8/2021 15:44:54'!
initializeFor: aValue

	value := aValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OneLegTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
OneLegTransaction class
	instanceVariableNames: ''!

!OneLegTransaction class methodsFor: 'instance creation' stamp: 'EF 7/8/2021 15:50:44'!
for: aValue

	^ self new initializeFor: aValue ! !

!OneLegTransaction class methodsFor: 'instance creation' stamp: 'EF 7/8/2021 15:44:09'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
OneLegTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'balance operations' stamp: 'EF 7/5/2021 23:25:58'!
effectOnBalance: aBalance

	^aBalance + value! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
OneLegTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'balance operations' stamp: 'EF 7/5/2021 23:26:15'!
effectOnBalance: aBalance

	^aBalance - value! !


!classDefinition: #TwoLegsTransaction category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TwoLegsTransaction
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TwoLegsTransaction methodsFor: 'initialization' stamp: 'EF 7/8/2021 15:47:14'!
initializeBy: aTransfer
	
	transfer := aTransfer! !


!TwoLegsTransaction methodsFor: 'value' stamp: 'EF 7/5/2021 23:30:04'!
value

	^transfer value! !


!TwoLegsTransaction methodsFor: 'counterpart' stamp: 'EF 7/5/2021 23:56:27'!
counterpart

	^self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TwoLegsTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
TwoLegsTransaction class
	instanceVariableNames: 'transfer'!

!TwoLegsTransaction class methodsFor: 'instance creation' stamp: 'EF 7/8/2021 15:47:14'!
by: aTransfer 
	
	^self new initializeBy: aTransfer! !

!TwoLegsTransaction class methodsFor: 'instance creation' stamp: 'EF 7/5/2021 23:24:21'!
registerOn: anAccount by: aTransfer

	| transaction |
	
	transaction := self by: aTransfer.
	anAccount register: transaction.
	
	^transaction! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
TwoLegsTransaction subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'balance operations' stamp: 'EF 7/5/2021 23:32:36'!
effectOnBalance: aBalance 

	^aBalance + self value! !


!TransferDeposit methodsFor: 'counterpart' stamp: 'EF 7/5/2021 23:38:11'!
counterpart
	
	^transfer withdrawLeg! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
TwoLegsTransaction subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'balance operations' stamp: 'EF 7/5/2021 23:32:41'!
effectOnBalance: aBalance 

	^aBalance - self value! !


!TransferWithdraw methodsFor: 'counterpart' stamp: 'EF 7/5/2021 23:38:28'!
counterpart
	
	^transfer depositLeg! !


!classDefinition: #BankAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #BankAccount
	instanceVariableNames: 'parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!BankAccount methodsFor: 'initialization' stamp: 'EF 7/7/2021 17:41:09'!
initialize

	parents := OrderedCollection new! !


!BankAccount methodsFor: 'tree management - private' stamp: 'EF 7/7/2021 17:44:14'!
addParent: aBankAccount

	parents add: aBankAccount! !

!BankAccount methodsFor: 'tree management - private' stamp: 'EF 7/8/2021 09:48:40'!
allElementsInTree

	| elements |
	
	elements := Set new.
	parents ifEmpty: [ ^self deepElements ]
		    ifNotEmpty: [ parents do: [ :aParent | elements addAll: aParent deepElements ] ].
	^elements! !

!BankAccount methodsFor: 'tree management - private' stamp: 'EF 7/7/2021 16:07:36'!
deepElements

	self shouldBeImplemented ! !


!BankAccount methodsFor: 'main protocol' stamp: 'EF 7/8/2021 14:27:43'!
balance

	self subclassResponsibility! !

!BankAccount methodsFor: 'main protocol' stamp: 'EF 7/8/2021 14:27:59'!
hasRegistered: aTransaction

	self subclassResponsibility! !

!BankAccount methodsFor: 'main protocol' stamp: 'EF 7/8/2021 14:27:52'!
transactions

	self subclassResponsibility! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
BankAccount subclass: #Portfolio
	instanceVariableNames: 'bankAccounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main protocol' stamp: 'EF 7/7/2021 15:23:52'!
add: aBankAccount
	
	self assertCanAdd: aBankAccount.
	
	bankAccounts add: aBankAccount.	
	aBankAccount addParent: self! !

!Portfolio methodsFor: 'main protocol' stamp: 'EF 7/7/2021 12:29:28'!
balance
	
	^bankAccounts sum: [ :aBankAccount | aBankAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'EF 7/7/2021 12:40:14'!
hasRegistered: aTransaction

	^bankAccounts anySatisfy: [ :aBankAccount | aBankAccount hasRegistered: aTransaction ]
	
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'EF 7/8/2021 12:50:03'!
transactions
	
	| transactions |
	transactions := OrderedCollection new.
	
	bankAccounts do: [ :aBankAccount | transactions addAll: aBankAccount transactions ].
	^transactions! !


!Portfolio methodsFor: 'testing' stamp: 'EF 7/7/2021 13:10:48'!
bankAccountsSize
	
	^bankAccounts size! !

!Portfolio methodsFor: 'testing' stamp: 'EF 7/8/2021 09:48:26'!
isAnyRepetitionWith: aBankAccount

	^(self allElementsInTree intersection: aBankAccount allElementsInTree) isEmpty not! !


!Portfolio methodsFor: 'assertions' stamp: 'EF 7/7/2021 17:38:50'!
assertCanAdd: aBankAccount
	
	(self isAnyRepetitionWith: aBankAccount) ifTrue: [ self error: self class repeatedAccountErrorMessage ].
	! !


!Portfolio methodsFor: 'tree management - private' stamp: 'EF 7/7/2021 17:43:51'!
addParent: aBankAccount

	super addParent: aBankAccount.
	bankAccounts do: [ :aChildBankAccount | aChildBankAccount addParent: aBankAccount ]! !

!Portfolio methodsFor: 'tree management - private' stamp: 'EF 7/8/2021 02:29:50'!
deepElements

	| elements |
	elements := Set new.
	
	elements add: self.
	bankAccounts do: [ :aBankAccount | elements addAll: aBankAccount deepElements ].
	^elements! !


!Portfolio methodsFor: 'initialization' stamp: 'EF 7/7/2021 17:41:35'!
initialize
	
	super initialize.
	bankAccounts := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error messages' stamp: 'EF 7/7/2021 13:08:32'!
repeatedAccountErrorMessage

	^'Cannot add a repeated account'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'EF 7/8/2021 16:11:30'!
new
	
	"Lo declaro explícitamente para indicarle al
	usuario que puede utilizarlo"
	^super new! !

!Portfolio class methodsFor: 'instance creation' stamp: 'EF 7/8/2021 13:20:30'!
with: aBankAccount
	
	| portfolio |
	portfolio := self new.
	portfolio add: aBankAccount.
	^portfolio! !

!Portfolio class methodsFor: 'instance creation' stamp: 'EF 7/8/2021 16:12:22'!
with: aBankAccount with: anotherBankAccount 

	| portfolio |
	portfolio := self new.
	portfolio add: aBankAccount.
	portfolio add: anotherBankAccount.
	^portfolio! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
BankAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'EF 7/7/2021 17:41:23'!
initialize

	super initialize.
	transactions := OrderedCollection new.
! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'EF 7/5/2021 23:27:05'!
balance

	^transactions inject: 0*peso into: [ :aCurrentBalance :aTransaction | aTransaction effectOnBalance: aCurrentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'tree management - private' stamp: 'EF 7/7/2021 15:29:22'!
deepElements

	^OrderedCollection with: self! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdraw deposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'EF 7/8/2021 15:40:44'!
initializeFor: aValue from: aWithdrawAccount to: aDepositAccount 

	value := aValue.
	withdraw := TransferWithdraw registerOn: aWithdrawAccount by: self.
	deposit := TransferDeposit registerOn: aDepositAccount by: self.! !


!Transfer methodsFor: 'transaction legs' stamp: 'EF 7/5/2021 23:37:27'!
depositLeg
	
	^deposit! !

!Transfer methodsFor: 'transaction legs' stamp: 'EF 7/5/2021 23:37:14'!
withdrawLeg
	
	^withdraw! !


!Transfer methodsFor: 'value' stamp: 'EF 7/5/2021 23:25:21'!
value

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'assertions' stamp: 'EF 7/8/2021 16:03:47'!
assert: aWithdrawAccount shouldBeDifferentFrom: aDepositAccount

	aWithdrawAccount = aDepositAccount ifTrue: [ self error: self accountsCannotBeEqualErrorMessage ]! !

!Transfer class methodsFor: 'assertions' stamp: 'EF 7/5/2021 23:57:45'!
assertValueShouldBeValid: aValue

	aValue > 0 ifFalse: [ self error: self nonPositiveTransferredAmountErrorMessage ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'EF 7/8/2021 16:00:11'!
register: aValue from: aWithdrawAccount to: aDepositAccount 
	
	self assertValueShouldBeValid: aValue.
	self assert: aWithdrawAccount shouldBeDifferentFrom: aDepositAccount.
	^self new initializeFor: aValue from: aWithdrawAccount to: aDepositAccount
	! !


!Transfer class methodsFor: 'error messages' stamp: 'EF 7/8/2021 16:00:59'!
accountsCannotBeEqualErrorMessage
	
	^'Accounts involved in a transfer cannot be the same'! !

!Transfer class methodsFor: 'error messages' stamp: 'EF 7/5/2021 23:57:45'!
nonPositiveTransferredAmountErrorMessage
	
	^'Amount transferred should be a positive value'! !
