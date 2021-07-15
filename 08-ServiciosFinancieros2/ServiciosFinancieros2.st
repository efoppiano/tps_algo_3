!classDefinition: #PortfolioTest category: 'ServiciosFinancieros2'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros2'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

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


!classDefinition: #SummaryTest category: 'ServiciosFinancieros2'!
TestCase subclass: #SummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!SummaryTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:13:43'!
test01AccountSummaryForEmptyAccountRegistersBalanceZero

	| account accountSummary |
	account := ReceptiveAccount new.
	accountSummary := (AccountSummary for: account) summary.
	
	self assert: (self stringBalanceOf: 0*peso) equals: accountSummary first.
	self assert: 1 equals: accountSummary size! !

!SummaryTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:17:00'!
test02AccountSummaryRegistersDeposit

	| account accountSummary depositedAmount |
	account := ReceptiveAccount new.
	depositedAmount := 100*peso.
	Deposit register: depositedAmount on: account.
	accountSummary := (AccountSummary for: account) summary.
	
	self assert: (self stringDepositOf: depositedAmount) equals: accountSummary first.
	self assert: (self stringBalanceOf: depositedAmount) equals: accountSummary second.
	self assert: 2 equals: accountSummary size! !

!SummaryTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:18:01'!
test03AccountSummaryRegistersExtraction

	| account accountSummary withdrawnAmount |
	account := ReceptiveAccount new.
	withdrawnAmount := 100*peso.
	Withdraw register: withdrawnAmount on: account.
	accountSummary := (AccountSummary for: account) summary.
	
	self assert: (self stringWithdrawOf: withdrawnAmount) equals: accountSummary first.
	self assert: (self stringBalanceOf: withdrawnAmount negated) equals: accountSummary second.
	self assert: 2 equals: accountSummary size! !

!SummaryTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:18:31'!
test04AccountSummaryRegistersTransferExtraction

	| depositAccount withdrawAccount withdrawAccountSummary transferredAmount |
	withdrawAccount := ReceptiveAccount new.
	depositAccount := ReceptiveAccount new.
	transferredAmount := 100*peso.
	Transfer amount: transferredAmount from: withdrawAccount to: depositAccount.
	withdrawAccountSummary := (AccountSummary for: withdrawAccount) summary.
	
	self assert: (self stringTransferWithdrawOf: transferredAmount) equals: withdrawAccountSummary first.
	self assert: (self stringBalanceOf: transferredAmount negated) equals: withdrawAccountSummary second.
	self assert: 2 equals: withdrawAccountSummary size! !

!SummaryTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:19:53'!
test05AccountSummaryRegistersTransferDeposit

	| depositAccount withdrawAccount depositAccountSummary transferredAmount |
	withdrawAccount := ReceptiveAccount new.
	depositAccount := ReceptiveAccount new.
	transferredAmount := 100*peso.
	Transfer amount: transferredAmount from: withdrawAccount to: depositAccount.
	depositAccountSummary := (AccountSummary for: depositAccount) summary.
	
	self assert: (self stringTransferDepositOf: transferredAmount) equals: depositAccountSummary first.
	self assert: (self stringBalanceOf: transferredAmount) equals: depositAccountSummary second.
	self assert: 2 equals: depositAccountSummary size! !

!SummaryTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:19:43'!
test06AccountSummaryRegistersMultipleTransactions

	| depositAccount withdrawAccount withdrawAccountSummary depositedAmount transferredAmount |
	withdrawAccount := ReceptiveAccount new.
	depositAccount := ReceptiveAccount new.
	depositedAmount := 100*peso.
	transferredAmount := 30*peso.
	Deposit register: depositedAmount on: withdrawAccount.
	Transfer amount: transferredAmount from: withdrawAccount to: depositAccount.
	withdrawAccountSummary := (AccountSummary for: withdrawAccount) summary.
	
	self assert: (self stringDepositOf: depositedAmount) equals: withdrawAccountSummary first.
	self assert: (self stringTransferWithdrawOf: transferredAmount) equals: withdrawAccountSummary second.
	self assert: (self stringBalanceOf: depositedAmount - transferredAmount) equals: withdrawAccountSummary third.
	self assert: 3 equals: withdrawAccountSummary size! !

!SummaryTest methodsFor: 'tests' stamp: 'EF 7/15/2021 16:52:07'!
test07TransferNetForEmptyAccountIsZero
	
	| account transferNet |
	
	account := ReceptiveAccount new.
	transferNet := (TransferNet for: account) value.
	
	self assert: 0*peso equals: transferNet! !

!SummaryTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:20:17'!
test08TransferNetIncreasesWithTransferDeposit
	
	| depositAccount withdrawAccount depositAccountTransferNet transferredAmount |
	
	withdrawAccount := ReceptiveAccount new.
	depositAccount := ReceptiveAccount new.
	transferredAmount := 100*peso.
	Transfer amount: transferredAmount from: withdrawAccount to: depositAccount.
	depositAccountTransferNet := (TransferNet for: depositAccount) value.

	self assert: transferredAmount equals: depositAccountTransferNet! !

!SummaryTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:20:29'!
test09TransferNetDecreasesWithTransferExtraction
	
	| depositAccount withdrawAccount withdrawAccountTransferNet transferredAmount |
	
	withdrawAccount := ReceptiveAccount new.
	depositAccount := ReceptiveAccount new.
	transferredAmount := 100*peso.
	Transfer amount: 100*peso from: withdrawAccount to: depositAccount.
	withdrawAccountTransferNet := (TransferNet for: withdrawAccount) value.

	self assert: transferredAmount negated equals: withdrawAccountTransferNet! !

!SummaryTest methodsFor: 'tests' stamp: 'EF 7/15/2021 16:52:19'!
test10TransferNetIsNotAffectedByNonTransferTransactions
	
	| account transferNet |
	
	account := ReceptiveAccount new.
	
	Deposit register: 50*peso on: account.
	Withdraw register: 20*peso on: account.
	transferNet := (TransferNet for: account) value.

	self assert: 0*peso equals: transferNet! !

!SummaryTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:21:24'!
test11TransferNetWorksWithMultipleTransactions
	
	| secondAccount firstAccount secondAccountTransferNet transferDepositedAmount transferWithdrawnAmount |
	
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	transferDepositedAmount := 50*peso.
	transferWithdrawnAmount := 20*peso.
	
	Transfer amount: transferDepositedAmount from: firstAccount to: secondAccount.	
	Transfer amount: transferWithdrawnAmount from: secondAccount to: firstAccount.
	secondAccountTransferNet := (TransferNet for: secondAccount) value.

	self assert: transferDepositedAmount - transferWithdrawnAmount equals: secondAccountTransferNet! !


!SummaryTest methodsFor: 'strings' stamp: 'EF 7/15/2021 18:13:43'!
stringBalanceOf: aValue

	^'Balance = ', aValue asString! !

!SummaryTest methodsFor: 'strings' stamp: 'EF 7/15/2021 18:14:21'!
stringDepositOf: aValue

	^'Deposito por ', aValue asString! !

!SummaryTest methodsFor: 'strings' stamp: 'EF 7/15/2021 18:13:51'!
stringTransferDepositOf: aValue

	^'Entrada por transferencia de ', aValue asString! !

!SummaryTest methodsFor: 'strings' stamp: 'EF 7/15/2021 18:14:05'!
stringTransferWithdrawOf: aValue

	^'Salida por transferencia de ', aValue asString! !

!SummaryTest methodsFor: 'strings' stamp: 'EF 7/15/2021 18:14:14'!
stringWithdrawOf: aValue

	^'Extraccion por ', aValue asString! !


!classDefinition: #SpecialSummariesTest category: 'ServiciosFinancieros2'!
SummaryTest subclass: #SpecialSummariesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!SpecialSummariesTest methodsFor: 'tests' stamp: 'EF 7/15/2021 17:49:46'!
test01PortfolioTreePrinterWorksWithEmptyPortfolio

	| portfolio portfolioTree |
	portfolio := Portfolio named: 'Portfolio raiz'.
	portfolioTree := (PortfolioTreePrinter for: portfolio) summaryLog.
	
	self assert: 'Portfolio raiz' equals: portfolioTree first
	! !

!SpecialSummariesTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:21:46'!
test02PortfolioTreePrinterWorksWithOneAccount

	| portfolio portfolioTree account |
	
	account := ReceptiveAccount named: 'Cuenta mia'.
	portfolio := Portfolio named: 'Portfolio de la familia' with: account.
	portfolioTree := (PortfolioTreePrinter for: portfolio) summaryLog.
	
	self assert: 'Portfolio de la familia' equals: portfolioTree first.
	self assert: '    Cuenta mia' equals: portfolioTree second

	! !

!SpecialSummariesTest methodsFor: 'tests' stamp: 'EF 7/15/2021 17:50:19'!
test03PortfolioTreePrinterWorksWithNestedEmptyPortfolio

	| portfolio portfolioTree childPortfolio |
	
	childPortfolio := Portfolio named: 'Portfolio de hijos'.
	portfolio := Portfolio named: 'Portfolio de la familia' with: childPortfolio.
	portfolioTree := (PortfolioTreePrinter for: portfolio) summaryLog.
	
	self assert: 'Portfolio de la familia' equals: portfolioTree first.
	self assert: '    Portfolio de hijos' equals: portfolioTree second.

	! !

!SpecialSummariesTest methodsFor: 'tests' stamp: 'EF 7/15/2021 17:50:37'!
test04PortfolioTreePrinterWorksWithManyAccounts

	| portfolioTree childrenPortfolio familyPortfolio johnsAccount myAccount |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	portfolioTree := (PortfolioTreePrinter for: familyPortfolio) summaryLog.
	
	self assert: 'Portfolio de la familia' equals: portfolioTree first.
	self assert: '    Cuenta mia' equals: portfolioTree second.
	self assert: '    Portfolio de hijos' equals: portfolioTree third.
	self assert: '        Cuenta de Juan' equals: portfolioTree fourth.


	! !

!SpecialSummariesTest methodsFor: 'tests' stamp: 'EF 7/15/2021 17:50:44'!
test05PortfolioDetailedTreePrinterWorksWithEmptyPortfolio

	| portfolio portfolioDetailedTree |
	portfolio := Portfolio named: 'Portfolio raiz'.
	portfolioDetailedTree := (PortfolioDetailedTreePrinter for: portfolio) summaryLog.
	
	self assert: 'Portfolio raiz' equals: portfolioDetailedTree first! !

!SpecialSummariesTest methodsFor: 'tests' stamp: 'EF 7/15/2021 17:50:56'!
test06PortfolioDetailedTreePrinterWorksWithOneAccount

	| portfolio portfolioDetailedTree account |
	
	account := ReceptiveAccount named: 'Cuenta mia'.
	portfolio := Portfolio named: 'Portfolio de la familia' with: account.
	portfolioDetailedTree := (PortfolioDetailedTreePrinter for: portfolio) summaryLog.
	
	self assert: 'Portfolio de la familia' equals: portfolioDetailedTree first.
	self assert: '    Cuenta mia' equals: portfolioDetailedTree second! !

!SpecialSummariesTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:13:43'!
test07PortfolioDetailedTreePrinterWorksWithOneAccount

	| portfolio account childPortfolio portfolioDetailedTree |
	
	account := ReceptiveAccount named: 'Cuenta mia'.
	childPortfolio := Portfolio named: 'Portfolio de hijos'.
	portfolio := Portfolio named: 'Portfolio de la familia' with: account with: childPortfolio.
	portfolioDetailedTree := (PortfolioDetailedTreePrinter for: portfolio) summaryLog.
	
	self assert: 'Portfolio de la familia' equals: portfolioDetailedTree first.
	self assert: '    Cuenta mia' equals: portfolioDetailedTree second.
	self assert: '        ', (self stringBalanceOf: 0*peso) equals: portfolioDetailedTree third.! !

!SpecialSummariesTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:13:43'!
test08PortfolioDetailedTreePrinterWorksWithManyEmptyAccounts

	| childrenPortfolio familyPortfolio johnsAccount portfolioDetailedTree |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: childrenPortfolio.
	portfolioDetailedTree := (PortfolioDetailedTreePrinter for: familyPortfolio) summaryLog.
	
	self assert: 'Portfolio de la familia' equals: portfolioDetailedTree first.
	self assert: '    Portfolio de hijos' equals: portfolioDetailedTree second.
	self assert: '        Cuenta de Juan' equals: portfolioDetailedTree third.
	self assert: '            ', (self stringBalanceOf: 0*peso) equals: portfolioDetailedTree fourth.

	! !

!SpecialSummariesTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:22:22'!
test09PortfolioDetailedTreePrinterRegistersDeposit

	| familyPortfolio myAccount portfolioDetailedTree depositedAmount |
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.
	depositedAmount := 100*peso.
	Deposit register: depositedAmount on: myAccount.
	portfolioDetailedTree := (PortfolioDetailedTreePrinter for: familyPortfolio) summaryLog.
	
	self assert: 'Portfolio de la familia' equals: portfolioDetailedTree first.
	self assert: '    Cuenta mia' equals: portfolioDetailedTree second.
	self assert: '        ', (self stringDepositOf: depositedAmount) equals: portfolioDetailedTree third.
	self assert: '        ', (self stringBalanceOf: depositedAmount) equals: portfolioDetailedTree fourth! !

!SpecialSummariesTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:22:41'!
test10PortfolioDetailedTreePrinterRegistersExtraction

	| familyPortfolio myAccount portfolioDetailedTree withdrawnAmount |
	
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.
	withdrawnAmount := 50*peso.
	Withdraw register: 50*peso on: myAccount.
	portfolioDetailedTree := (PortfolioDetailedTreePrinter for: familyPortfolio) summaryLog.
	
	self assert: 'Portfolio de la familia' equals: portfolioDetailedTree first.
	self assert: '    Cuenta mia' equals: portfolioDetailedTree second.
	self assert: '        ', (self stringWithdrawOf: withdrawnAmount) equals: portfolioDetailedTree third.
	self assert: '        ', (self stringBalanceOf: withdrawnAmount negated) equals: portfolioDetailedTree fourth! !

!SpecialSummariesTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:23:11'!
test11PortfolioDetailedTreePrinterRegistersTransferExtraction

	| familyPortfolio myAccount portfolioDetailedTree transferredAmount |
	
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.
	transferredAmount := 50*peso.
	Transfer amount: transferredAmount from: myAccount to: ReceptiveAccount new.
	portfolioDetailedTree := (PortfolioDetailedTreePrinter for: familyPortfolio) summaryLog.
	
	self assert: 'Portfolio de la familia' equals: portfolioDetailedTree first.
	self assert: '    Cuenta mia' equals: portfolioDetailedTree second.
	self assert: '        ', (self stringTransferWithdrawOf: transferredAmount) equals: portfolioDetailedTree third.
	self assert: '        ', (self stringBalanceOf: transferredAmount negated) equals: portfolioDetailedTree fourth! !

!SpecialSummariesTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:23:31'!
test12PortfolioDetailedTreePrinterRegistersTransferDeposit

	| familyPortfolio myAccount portfolioDetailedTree transferredAmount |
	
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.
	transferredAmount := 50*peso.
	Transfer amount: transferredAmount from: ReceptiveAccount new to: myAccount.
	portfolioDetailedTree := (PortfolioDetailedTreePrinter for: familyPortfolio) summaryLog.
	
	self assert: 'Portfolio de la familia' equals: portfolioDetailedTree first.
	self assert: '    Cuenta mia' equals: portfolioDetailedTree second.
	self assert: '        ', (self stringTransferDepositOf: transferredAmount) equals: portfolioDetailedTree third.
	self assert: '        ', (self stringBalanceOf: transferredAmount) equals: portfolioDetailedTree fourth! !

!SpecialSummariesTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:24:18'!
test13PortfolioDetailedTreePrinterRegistersMultipleTransactions

	| familyPortfolio myAccount portfolioDetailedTree depositedAmount transferredAmount |
	
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount.
	depositedAmount := 100*peso.
	transferredAmount := 50*peso.
	Deposit register: 100*peso on: myAccount.
	Transfer amount: 50*peso from: ReceptiveAccount new to: myAccount.
	portfolioDetailedTree := (PortfolioDetailedTreePrinter for: familyPortfolio) summaryLog.
	
	self assert: 'Portfolio de la familia' equals: portfolioDetailedTree first.
	self assert: '    Cuenta mia' equals: portfolioDetailedTree second.
	self assert: '        ', (self stringDepositOf: depositedAmount) equals: portfolioDetailedTree third.
	self assert: '        ', (self stringTransferDepositOf: transferredAmount) equals: portfolioDetailedTree fourth.
	self assert: '        ', (self stringBalanceOf: depositedAmount + transferredAmount) equals: portfolioDetailedTree fifth! !

!SpecialSummariesTest methodsFor: 'tests' stamp: 'EF 7/15/2021 18:24:57'!
test14PortfolioDetailedTreePrinterRegistersManyAccountsWithTransactions

	| familyPortfolio myAccount portfolioDetailedTree childrenPortfolio johnsAccount transferredAmount |
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount.
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	
	transferredAmount := 100*peso.
	Transfer amount: 100*peso from: johnsAccount to: myAccount.
	
	portfolioDetailedTree := (PortfolioDetailedTreePrinter for: familyPortfolio) summaryLog.
	
	self assert: 'Portfolio de la familia' equals: portfolioDetailedTree first.
	self assert: '    Cuenta mia' equals: portfolioDetailedTree second.
	self assert: '        ', (self stringTransferDepositOf: transferredAmount) equals: portfolioDetailedTree third.
	self assert: '        ', (self stringBalanceOf: transferredAmount) equals: portfolioDetailedTree fourth.
	self assert: '    Portfolio de hijos' equals: portfolioDetailedTree fifth.
	self assert: '        Cuenta de Juan' equals: portfolioDetailedTree sixth.
	self assert: '            ', (self stringTransferWithdrawOf: transferredAmount) equals: portfolioDetailedTree seventh.
	self assert: '            ', (self stringBalanceOf: transferredAmount negated) equals: portfolioDetailedTree eighth! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros2'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros2'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 18:32:26'!
accept: anAccountVisitor

	self subclassResponsibility ! !


!Account methodsFor: 'name' stamp: 'EF 7/12/2021 21:21:14'!
name
	
	^name ! !


!Account methodsFor: 'initialization' stamp: 'EF 7/15/2021 17:27:36'!
initializeUnnamed

	name := 'Unnamed account'! !

!Account methodsFor: 'initialization' stamp: 'EF 7/12/2021 21:21:14'!
named: aName 

	name := aName! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros2'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'instance creation' stamp: 'EF 7/15/2021 17:25:29'!
named: aName 

	^self new named: aName! !

!Account class methodsFor: 'instance creation' stamp: 'EF 7/15/2021 17:30:42'!
new

	^super new initializeUnnamed! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros2'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'EF 7/9/2021 10:46:59'!
accounts

	^accounts! !

!Portfolio methodsFor: 'main protocol' stamp: 'EF 7/12/2021 20:12:20'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0*peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 18:32:01'!
accept: anAccountVisitor

	anAccountVisitor visitPortfolio: self! !

!Portfolio methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 17:20:19'!
visitAccountsWith: anAccountVisitor 

	accounts do: [ :aChildAccount | aChildAccount accept: anAccountVisitor ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros2'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'EF 7/9/2021 10:53:49'!
named: aName with: anAccount 
	
	| portfolio |
	
	portfolio := self named: aName.
	portfolio add: anAccount.
	^portfolio! !

!Portfolio class methodsFor: 'instance creation' stamp: 'EF 7/9/2021 10:53:28'!
named: aName with: anAccount with: anotherAccount
 
	| portfolio |
	
	portfolio := self named: aName with: anAccount.
	portfolio add: anotherAccount.
	^portfolio
	! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!Portfolio class methodsFor: 'error messages' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros2'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'EF 7/10/2021 14:10:43'!
balance

	^transactions 
		inject: 0*peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
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


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 18:31:55'!
accept: anAccountVisitor

	anAccountVisitor visitReceptiveAccount: self! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros2'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 14:50:36'!
accept: aTransactionVisitor

	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros2'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'summary processing' stamp: 'EF 7/15/2021 14:50:45'!
accept: aTransactionVisitor

	^aTransactionVisitor visitDeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros2'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'register' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros2'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros2'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros2'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'summary processing' stamp: 'EF 7/15/2021 14:50:50'!
accept: aTransactionVisitor

	^aTransactionVisitor visitTransferDepositLeg: self! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros2'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'summary processing' stamp: 'EF 7/15/2021 14:50:54'!
accept: aTransactionVisitor

	^aTransactionVisitor visitTransferWithdrawLeg: self! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros2'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'summary processing' stamp: 'EF 7/15/2021 14:50:58'!
accept: aTransactionVisitor

	^aTransactionVisitor visitWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros2'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'register' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #AccountVisitor category: 'ServiciosFinancieros2'!
Object subclass: #AccountVisitor
	instanceVariableNames: 'summaryLog depth account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!AccountVisitor methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 17:19:40'!
visitPortfolio: aPortfolio
	
	self addToTree: aPortfolio name.
	self inNewBranch: [ 	aPortfolio visitAccountsWith: self ]! !

!AccountVisitor methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 15:56:48'!
visitReceptiveAccount: aReceptiveAccount

	self subclassResponsibility ! !


!AccountVisitor methodsFor: 'main protocol' stamp: 'EF 7/15/2021 17:02:13'!
summaryLog
	
	summaryLog := OrderedCollection new.
	depth := 0.
	
	account accept: self.
	
	^summaryLog! !


!AccountVisitor methodsFor: 'branching' stamp: 'EF 7/15/2021 17:13:03'!
addToTree: aString

	summaryLog add: (self withIndentation: aString)! !

!AccountVisitor methodsFor: 'branching' stamp: 'EF 7/12/2021 20:33:10'!
enteringBranch

	^ depth := depth + 1! !

!AccountVisitor methodsFor: 'branching' stamp: 'EF 7/9/2021 19:39:15'!
inNewBranch: aBlock

	self enteringBranch.
	aBlock value.
	self leavingBranch.! !

!AccountVisitor methodsFor: 'branching' stamp: 'EF 7/12/2021 20:33:14'!
leavingBranch

	^ depth := depth - 1! !


!AccountVisitor methodsFor: 'string indentation' stamp: 'EF 7/12/2021 20:33:45'!
withIndentation: aString

	^(String new: 4*depth withAll: $ ), aString.! !


!AccountVisitor methodsFor: 'initialization' stamp: 'EF 7/15/2021 17:10:46'!
initializeFor: anAccount

	account := anAccount.
	depth := 0.
	summaryLog := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountVisitor class' category: 'ServiciosFinancieros2'!
AccountVisitor class
	instanceVariableNames: ''!

!AccountVisitor class methodsFor: 'instance creation' stamp: 'EF 7/15/2021 17:14:03'!
for: anAccount

	^self new initializeFor: anAccount! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros2'!
AccountVisitor subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!PortfolioDetailedTreePrinter methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 16:59:40'!
visitReceptiveAccount: aReceptiveAccount
	
	| accountSummaryLog | 
	
	self addToTree: aReceptiveAccount name.
	self inNewBranch: [ 
		accountSummaryLog := (AccountSummary for: aReceptiveAccount) summary.
		accountSummaryLog do: [ :anAccountSummaryLogLine | self addToTree: anAccountSummaryLogLine]	]	
	! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros2'!
AccountVisitor subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!PortfolioTreePrinter methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 15:56:48'!
visitReceptiveAccount: aReceptiveAccount
	
	self addToTree: aReceptiveAccount name! !


!classDefinition: #TransactionVisitor category: 'ServiciosFinancieros2'!
Object subclass: #TransactionVisitor
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!TransactionVisitor methodsFor: 'initialization' stamp: 'EF 7/15/2021 16:33:45'!
initializeFor: anAccount

	account := anAccount! !


!TransactionVisitor methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 18:35:56'!
visitDeposit: aDeposit

	self subclassResponsibility ! !

!TransactionVisitor methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 18:36:18'!
visitTransferDepositLeg: aTransferDepositLeg

	self subclassResponsibility ! !

!TransactionVisitor methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 18:36:31'!
visitTransferWithdrawLeg: aTransferWithdrawLeg

	self subclassResponsibility ! !

!TransactionVisitor methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 18:36:06'!
visitWithdraw: aWithdraw

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransactionVisitor class' category: 'ServiciosFinancieros2'!
TransactionVisitor class
	instanceVariableNames: ''!

!TransactionVisitor class methodsFor: 'instance creation' stamp: 'EF 7/15/2021 16:35:18'!
for: anAccount

	^self new initializeFor: anAccount! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros2'!
TransactionVisitor subclass: #AccountSummary
	instanceVariableNames: 'summaryLogs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!AccountSummary methodsFor: 'main protocol' stamp: 'EF 7/15/2021 16:41:16'!
summary

	summaryLogs := OrderedCollection new.
	
	account transactions do: [ :aTransaction | aTransaction accept: self ].
	
	summaryLogs add: 'Balance = ', account balance asString.
	^summaryLogs! !


!AccountSummary methodsFor: 'initialization' stamp: 'EF 7/15/2021 16:37:15'!
initializeFor: anAccount

	super initializeFor: anAccount.
	summaryLogs := OrderedCollection new.! !


!AccountSummary methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 16:41:23'!
visitDeposit: aDeposit
	
	^summaryLogs add: 'Deposito por ', aDeposit value asString! !

!AccountSummary methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 16:41:31'!
visitTransferDepositLeg: aTransferDepositLeg

	^summaryLogs add: 'Entrada por transferencia de ', aTransferDepositLeg value asString! !

!AccountSummary methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 16:41:37'!
visitTransferWithdrawLeg: aTransferWithdrawLeg

	^summaryLogs add: 'Salida por transferencia de ', aTransferWithdrawLeg value asString! !

!AccountSummary methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 16:41:43'!
visitWithdraw: aWithdraw
	
	^summaryLogs add: 'Extraccion por ', aWithdraw value asString! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros2'!
TransactionVisitor subclass: #TransferNet
	instanceVariableNames: 'transferNet value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!TransferNet methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 14:39:32'!
visitDeposit: aDeposit! !

!TransferNet methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 18:15:19'!
visitTransferDepositLeg: aTransferDepositLeg

	value := value + aTransferDepositLeg value! !

!TransferNet methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 18:15:19'!
visitTransferWithdrawLeg: aTransferwithdrawLeg

	value := value - aTransferwithdrawLeg value! !

!TransferNet methodsFor: 'visitor protocol' stamp: 'EF 7/15/2021 14:39:41'!
visitWithdraw: aWithdraw! !


!TransferNet methodsFor: 'main protocol' stamp: 'EF 7/15/2021 18:15:19'!
value

	value := 0.
	
	account transactions do: [ :aTransaction | aTransaction accept: self ].
	
	^value! !


!TransferNet methodsFor: 'initialization' stamp: 'EF 7/15/2021 18:15:19'!
initializeFor: anAccount

	super initializeFor: anAccount.
	value := 0.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros2'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros2'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
