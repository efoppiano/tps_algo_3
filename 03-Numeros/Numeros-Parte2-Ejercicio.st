!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'EF 5/27/2021 23:00:02'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 5/7/2020 17:46:14'!
test27EnteroSubstractsEnteroCorrectly

	self assert: three - one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'EF 5/29/2021 18:31:28'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'EF 5/29/2021 18:37:08'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'EF 5/29/2021 19:20:00'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/27/2021 23:10:50'!
beAddedToEntero: anEnteroAugend

	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/27/2021 23:11:25'!
beAddedToFraccion: anFraccionAugend

	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/31/2021 02:08:43'!
beSubtractedFromEntero: anEnteroMinuend

	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/31/2021 02:09:00'!
beSubtractedFromFraccion: aFraccionMinuend

	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/27/2021 23:11:56'!
divideEntero: anEnteroDividend

	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/27/2021 23:11:47'!
divideFraccion: aFraccionDividend

	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/31/2021 02:12:01'!
multiplyEntero: anEnteroMultiplicand

	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/31/2021 02:12:11'!
multiplyFraccion: aFraccionMultiplicand

	self subclassResponsibility.! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de N�mero Inv�lido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'EF 5/29/2021 19:10:28'!
* aMultiplier 
	
	^aMultiplier multiplyEntero: self.

	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'EF 5/27/2021 22:34:20'!
+ anAdder 
	
	^anAdder beAddedToEntero: self

! !

!Entero methodsFor: 'arithmetic operations' stamp: 'EF 5/30/2021 02:32:34'!
- aSubtrahend 
	
	^aSubtrahend beSubtractedFromEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'EF 5/29/2021 18:51:15'!
/ aDivisor 
	
	^aDivisor divideEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'EF 5/29/2021 20:45:06'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	self ifNegativo: [self error: Entero negativeFibonacciErrorDescription ].	
	self ifCero: [^one].
	self ifUno: [^one].
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'EF 5/29/2021 20:14:30'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/29/2021 20:22:10'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/27/2021 22:46:35'!
beAddedToEntero: anEnteroAugend

	^self class with: anEnteroAugend integerValue + value.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/27/2021 23:04:56'!
beAddedToFraccion: aFraccionAugend

	| newNumerator newDenominator |
		
	newNumerator := self * aFraccionAugend denominator + aFraccionAugend numerator.
	newDenominator := aFraccionAugend denominator.
	
	^newNumerator/newDenominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/29/2021 18:52:51'!
beSubtractedFromEntero: anEnteroMinuend

	^self class with: anEnteroMinuend integerValue - value.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/29/2021 18:52:38'!
beSubtractedFromFraccion: aFraccionMinuend

	| newNumerator newDenominator |
		
	newNumerator := aFraccionMinuend numerator - (self * aFraccionMinuend denominator).
	newDenominator := aFraccionMinuend denominator.
	
	^newNumerator/newDenominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/27/2021 22:56:47'!
divideEntero: anEnteroDividend

	^Fraccion with: anEnteroDividend over: self! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/27/2021 23:09:53'!
divideFraccion: aFraccionDividend

	| newNumerator newDenominator |

	newNumerator := aFraccionDividend numerator.
	newDenominator := aFraccionDividend denominator * self.
	
	^newNumerator/newDenominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/29/2021 20:22:25'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/29/2021 19:10:28'!
multiplyEntero: anEnteroMultiplicand

	^self class with: value * anEnteroMultiplicand integerValue
	! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'EF 5/31/2021 12:37:57'!
multiplyFraccion: aFraccionMultiplicand
	
	| newNumerator newDenominator |
	
	newNumerator := aFraccionMultiplicand numerator * self.
	newDenominator := aFraccionMultiplicand denominator.
	^newNumerator/newDenominator! !


!Entero methodsFor: 'checks' stamp: 'EF 5/31/2021 13:04:28'!
ifCero: alternativeBlock
	
	^self subclassResponsibility.! !

!Entero methodsFor: 'checks' stamp: 'EF 5/31/2021 13:04:31'!
ifMayorQueUno: alternativeBlock
	
	^self subclassResponsibility.! !

!Entero methodsFor: 'checks' stamp: 'EF 5/31/2021 13:04:34'!
ifNegativo: alternativeBlock
	
	^self subclassResponsibility.! !

!Entero methodsFor: 'checks' stamp: 'EF 5/31/2021 13:04:38'!
ifUno: alternativeBlock
	
	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no est� definido aqu� para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'EF 5/29/2021 22:19:01'!
with: aValue 

	| classToInstantiate |
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	classToInstantiate := Entero allSubclasses detect: [:class | class isAbleToInstantiateWith: aValue ].
	^classToInstantiate new initializeWith: aValue.! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'checks' stamp: 'EF 5/31/2021 12:56:15'!
ifCero: alternativeBlock
	
	^alternativeBlock value.
	! !

!Cero methodsFor: 'checks' stamp: 'EF 5/31/2021 12:56:18'!
ifMayorQueUno: alternativeBlock

	^self.! !

!Cero methodsFor: 'checks' stamp: 'EF 5/31/2021 12:56:21'!
ifNegativo: alternativeBlock

	^self.! !

!Cero methodsFor: 'checks' stamp: 'EF 5/31/2021 12:56:25'!
ifUno: alternativeBlock

	^self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numeros-Parte2-Ejercicio'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'as yet unclassified' stamp: 'EF 5/31/2021 12:39:55'!
isAbleToInstantiateWith: aValue

	^aValue = 0.! !


!classDefinition: #Negativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Negativo methodsFor: 'checks' stamp: 'EF 5/31/2021 12:41:59'!
ifCero: alternativeBlock

	^self.! !

!Negativo methodsFor: 'checks' stamp: 'EF 5/31/2021 12:42:02'!
ifMayorQueUno: alternativeBlock

	^self.! !

!Negativo methodsFor: 'checks' stamp: 'EF 5/31/2021 12:42:08'!
ifNegativo: alternativeBlock

	^alternativeBlock value.! !

!Negativo methodsFor: 'checks' stamp: 'EF 5/31/2021 12:42:12'!
ifUno: alternativeBlock

	^self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Negativo class' category: 'Numeros-Parte2-Ejercicio'!
Negativo class
	instanceVariableNames: ''!

!Negativo class methodsFor: 'as yet unclassified' stamp: 'EF 5/31/2021 12:39:59'!
isAbleToInstantiateWith: aValue

	^aValue < 0.! !


!classDefinition: #Positivo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Positivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Positivo methodsFor: 'checks' stamp: 'EF 5/31/2021 12:42:26'!
ifCero: alternativeBlock
	
	^self.! !

!Positivo methodsFor: 'checks' stamp: 'EF 5/31/2021 12:42:22'!
ifNegativo: alternativeBlock

	^self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Positivo class' category: 'Numeros-Parte2-Ejercicio'!
Positivo class
	instanceVariableNames: ''!

!Positivo class methodsFor: 'as yet unclassified' stamp: 'EF 5/31/2021 12:40:06'!
isAbleToInstantiateWith: aValue

	"Una clase abstracta no puede instanciarse"
	^false! !


!classDefinition: #MayorQueUno category: 'Numeros-Parte2-Ejercicio'!
Positivo subclass: #MayorQueUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!MayorQueUno methodsFor: 'checks' stamp: 'EF 5/31/2021 12:43:04'!
ifMayorQueUno: alternativeBlock
	
	^alternativeBlock value.! !

!MayorQueUno methodsFor: 'checks' stamp: 'EF 5/31/2021 12:43:08'!
ifUno: alternativeBlock

	^self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MayorQueUno class' category: 'Numeros-Parte2-Ejercicio'!
MayorQueUno class
	instanceVariableNames: ''!

!MayorQueUno class methodsFor: 'as yet unclassified' stamp: 'EF 5/31/2021 12:40:11'!
isAbleToInstantiateWith: aValue

	^aValue > 1.! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
Positivo subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'checks' stamp: 'EF 5/31/2021 12:43:12'!
ifMayorQueUno: alternativeBlock

	^self.! !

!Uno methodsFor: 'checks' stamp: 'EF 5/31/2021 12:43:16'!
ifUno: alternativeBlock
	
	^alternativeBlock value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numeros-Parte2-Ejercicio'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'as yet unclassified' stamp: 'EF 5/31/2021 12:40:15'!
isAbleToInstantiateWith: aValue

	^aValue = 1.! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'EF 5/29/2021 19:10:13'!
* aMultiplier
	
	^aMultiplier multiplyFraccion: self.

	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'EF 5/27/2021 23:05:19'!
+ anAdder 
	
	^anAdder beAddedToFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'EF 5/29/2021 18:52:38'!
- aSubtrahend 
	
	^aSubtrahend beSubtractedFromFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'EF 5/27/2021 23:10:21'!
/ aDivisor 
	
	^aDivisor divideFraccion: self.
! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'EF 5/27/2021 22:54:23'!
beAddedToEntero: anEnteroAugend

	| newNumerator newDenominator |
		
	newNumerator := denominator * anEnteroAugend  + numerator.
	newDenominator := denominator.
	
	^newNumerator/newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'EF 5/27/2021 23:07:13'!
beAddedToFraccion: aFraccionAugend

	| newNumerator newDenominator |
	
	newNumerator := (numerator * aFraccionAugend denominator) + (denominator * aFraccionAugend numerator).
	newDenominator := denominator * aFraccionAugend denominator.
	^newNumerator/newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'EF 5/29/2021 18:52:51'!
beSubtractedFromEntero: anEnteroMinuend

	| newNumerator newDenominator |
		
	newNumerator := denominator * anEnteroMinuend  - numerator.
	newDenominator := denominator.
	
	^newNumerator/newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'EF 5/29/2021 18:52:38'!
beSubtractedFromFraccion: aFraccionMinuend

	| newNumerator newDenominator |
	
	newNumerator := (denominator * aFraccionMinuend numerator) - (numerator * aFraccionMinuend denominator).
	newDenominator := denominator * aFraccionMinuend denominator.
	^newNumerator/newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'EF 5/27/2021 22:59:14'!
divideEntero: anEnteroDividend

	| newNumerator newDenominator |

	newNumerator := denominator * anEnteroDividend.
	newDenominator := numerator.
	
	^newNumerator/newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'EF 5/31/2021 12:46:07'!
divideFraccion: aFraccionDividend

	| newNumerator newDenominator |
	
	newNumerator := denominator * aFraccionDividend numerator.
	newDenominator := numerator * aFraccionDividend denominator.
	^newNumerator/newDenominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'EF 5/29/2021 19:10:28'!
multiplyEntero: anEnteroMultiplicand

	| newNumerator newDenominator |
	
	newNumerator := numerator * anEnteroMultiplicand.
	newDenominator := denominator.
	^newNumerator/newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'EF 5/29/2021 19:10:13'!
multiplyFraccion: aFraccionMultiplicand

	| newNumerator newDenominator |
	
	newNumerator := aFraccionMultiplicand numerator * numerator.
	newDenominator := aFraccionMultiplicand denominator * denominator.
	^newNumerator/newDenominator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'EF 5/29/2021 22:21:13'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor ifCero: [self error: self canNotDivideByZeroErrorDescription].
	aDivisor ifCero: [ ^aDividend ].
	
	aDivisor ifNegativo: [ ^aDividend negated / aDivisor negated].
		
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator ifUno: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
