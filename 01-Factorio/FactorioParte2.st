!classDefinition: #Caja category: 'FactorioParte2'!
DenotativeObject subclass: #Caja
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Caja class' category: 'FactorioParte2'!
Caja class
	instanceVariableNames: 'contenido'!

!Caja class methodsFor: 'as yet unclassified' stamp: 'EF 5/3/2021 21:31:11'!
agregarMenas: aCollectionOfMenas
	^contenido addAll: aCollectionOfMenas. ! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'EF 5/6/2021 19:40:09'!
cantidadDe: unObjeto
	^contenido count: [ :cadaElemento | cadaElemento = unObjeto ].! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:30:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new) add: 'una mena de carbon'; yourself).! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 17:37:47'!
vaciar
	contenido _ OrderedCollection new.! !


!classDefinition: #CintaA category: 'FactorioParte2'!
DenotativeObject subclass: #CintaA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaA class' category: 'FactorioParte2'!
CintaA class
	instanceVariableNames: 'destino contenido'!

!CintaA class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:28:00'!
agregarMenas: aCollectionOfMenas
	^destino agregarMenas: aCollectionOfMenas.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'EF 5/6/2021 19:40:24'!
cantidadDe: unObjeto
	^contenido count: [ :cadaElemento | cadaElemento = unObjeto ].! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'EF 5/6/2021 19:41:07'!
destino: unDestino 
	destino _ unDestino.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:30:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := Caja.
	contenido := ((OrderedCollection new)).! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'EF 5/6/2021 19:43:35'!
transportar
	destino agregarMenas: contenido.
	self vaciar.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 17:30:16'!
vaciar
	contenido _ OrderedCollection new.! !


!classDefinition: #CintaB category: 'FactorioParte2'!
DenotativeObject subclass: #CintaB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaB class' category: 'FactorioParte2'!
CintaB class
	instanceVariableNames: 'destino contenido'!

!CintaB class methodsFor: 'as yet unclassified' stamp: 'EF 5/6/2021 19:40:44'!
agregarMenas: aCollectionOfMenas
	^destino agregarMenas: aCollectionOfMenas.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'EF 5/6/2021 19:40:44'!
cantidadDe: unObjeto
	^contenido count: [ :cadaElemento | cadaElemento = unObjeto ].! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'EF 5/6/2021 19:40:55'!
destino: unDestino 
	destino _ unDestino.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:30:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := CintaA.
	contenido := ((OrderedCollection new)).! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'EF 5/6/2021 19:43:49'!
transportar
	destino agregarMenas: contenido.
	self vaciar.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:14:17'!
vaciar
	contenido _ OrderedCollection new.! !


!classDefinition: #ExtractorDeCarbon category: 'FactorioParte2'!
DenotativeObject subclass: #ExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeCarbon class' category: 'FactorioParte2'!
ExtractorDeCarbon class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:14:23'!
agregarEnergia: energiaExtra

	energiaActual _ energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:44:58'!
conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de carbon'! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:49'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:14:33'!
destino: unDestino 
	destino _ unDestino.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/15/2021 21:21:02'!
energiaActual

	^energiaActual.
! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:31:29'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:12:02'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas _ self menasAExtraerSegunEnergiaActual.
	energiaConsumida _ self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas).! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:30:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 2; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	destino := Caja.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:27'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:11:53'!
ponerEnCeroLaEnergia
	energiaActual _ 0 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:11:48'!
sacarEnergia: energiaASacar
	energiaActual _ energiaActual - energiaASacar! !


!classDefinition: #ExtractorDeHierro category: 'FactorioParte2'!
DenotativeObject subclass: #ExtractorDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeHierro class' category: 'FactorioParte2'!
ExtractorDeHierro class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:15:18'!
agregarEnergia: energiaExtra

	energiaActual _ energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 17:56:03'!
conjuntoDeMenasDeHierroCantidad: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de hierro'! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 17:49:37'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:15:09'!
destino: unDestino 
	destino _ unDestino.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 17:51:00'!
energiaActual

	^energiaActual.
! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 17:51:11'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:15:02'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas _ self menasAExtraerSegunEnergiaActual.
	energiaConsumida _ self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenasDeHierroCantidad: cantidadDeMenas).! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:30:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 2; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	destino := Caja.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 17:51:39'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:14:53'!
ponerEnCeroLaEnergia
	energiaActual _ 0 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:14:48'!
sacarEnergia: energiaASacar
	energiaActual _ energiaActual - energiaASacar! !


!classDefinition: #PruebasDeExtractorDeCarbon category: 'FactorioParte2'!
DenotativeObject subclass: #PruebasDeExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeExtractorDeCarbon class' category: 'FactorioParte2'!
PruebasDeExtractorDeCarbon class
	instanceVariableNames: ''!

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:37:39'!
setUp
	ExtractorDeCarbon destino: Caja.
	Caja vaciar.! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:41:43'!
test01UnExtractorSinEnergiaNoExtraeMenas
	"Cuando no cargue energia en el extractor, no saco menas"
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	Assert isTrue: ExtractorDeCarbon extraer isEmpty.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:46:54'!
test02UnExtractorConInsuficienteEnergiaNoExtraeMenas
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 1 * joule.
	Assert isTrue: ExtractorDeCarbon extraer isEmpty.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:47:56'!
test03UnExtractorConSuficienteEnergiaExtrae1Mena
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 1.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:49:57'!
test04UnExtractorConservaLaEnergiaNoUtilizada
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 7 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 1.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 2 * joule.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:50:53'!
test05UnExtractorPuedeExtraerMultiplesMenasConMuchaEnergia
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 50 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 10.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 0 * joule.
! !


!classDefinition: #PruebasDeExtractorDeHierro category: 'FactorioParte2'!
DenotativeObject subclass: #PruebasDeExtractorDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeExtractorDeHierro class' category: 'FactorioParte2'!
PruebasDeExtractorDeHierro class
	instanceVariableNames: ''!

!PruebasDeExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:25:39'!
setUp
	ExtractorDeHierro destino: Caja.
	Caja vaciar.! !

!PruebasDeExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:27:21'!
test01UnExtractorSinEnergiaNoExtraeMenas
	"Cuando no cargue energia en el extractor, no saco menas"
	ExtractorDeHierro ponerEnCeroLaEnergia.
	Assert isTrue: ExtractorDeHierro extraer isEmpty.
! !

!PruebasDeExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:26:00'!
test02UnExtractorConInsuficienteEnergiaNoExtraeMenas
	ExtractorDeHierro ponerEnCeroLaEnergia.
	ExtractorDeHierro agregarEnergia: 1 * joule.
	Assert isTrue: ExtractorDeHierro extraer isEmpty.
! !

!PruebasDeExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:27:07'!
test03UnExtractorConSuficienteEnergiaExtrae1Mena
	ExtractorDeHierro ponerEnCeroLaEnergia.
	ExtractorDeHierro agregarEnergia: 5 * joule.
	Assert that: ExtractorDeHierro extraer size isEqualTo: 1.
! !

!PruebasDeExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:27:01'!
test04UnExtractorConservaLaEnergiaNoUtilizada
	ExtractorDeHierro ponerEnCeroLaEnergia.
	ExtractorDeHierro agregarEnergia: 7 * joule.
	Assert that: ExtractorDeHierro extraer size isEqualTo: 1.
	Assert that: ExtractorDeHierro energiaActual isEqualTo: 2 * joule.
! !

!PruebasDeExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:26:28'!
test05UnExtractorPuedeExtraerMultiplesMenasConMuchaEnergia
	ExtractorDeHierro ponerEnCeroLaEnergia.
	ExtractorDeHierro agregarEnergia: 50 * joule.
	Assert that: ExtractorDeHierro extraer size isEqualTo: 10.
	Assert that: ExtractorDeHierro energiaActual isEqualTo: 0 * joule.
! !


!classDefinition: #PruebasDeFactorio category: 'FactorioParte2'!
DenotativeObject subclass: #PruebasDeFactorio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeFactorio class' category: 'FactorioParte2'!
PruebasDeFactorio class
	instanceVariableNames: ''!

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 17:54:15'!
testEscenarioDosExtractoresDosCintasCaja
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeHierro ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeHierro agregarEnergia: 5 * joule.
	
	ExtractorDeCarbon destino: CintaA.
	ExtractorDeHierro destino: CintaB.
	CintaB destino: CintaA.
	CintaA destino: Caja.
	
	Caja vaciar.
	CintaA vaciar.
	CintaB vaciar.
	
	ExtractorDeCarbon extraer.
	ExtractorDeHierro extraer.
	
	CintaB transportar.
	CintaA transportar.

	Assert that: (Caja cantidadDe: 'una mena de hierro') isEqualTo: 1.
	Assert that: (Caja cantidadDe: 'una mena de carbon') isEqualTo: 1.
	
	Assert that: (CintaA cantidadDe: 'una mena de carbon') isEqualTo: 0.
	Assert that: (CintaA cantidadDe: 'una mena de hierro') isEqualTo: 0.
	
	Assert that: (CintaB cantidadDe: 'una mena de carbon') isEqualTo: 0.
	Assert that: (CintaB cantidadDe: 'una mena de hierro') isEqualTo: 0.

	
	
	
	! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'EF 5/6/2021 19:44:11'!
testEscenarioExtractorCaja
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: Caja.
	Caja vaciar.
	
	ExtractorDeCarbon extraer.
	
	Assert that: (Caja cantidadDe: 'una mena de carbon') isEqualTo: 1.
	Assert that: (CintaA cantidadDe: 'una mena de carbon') isEqualTo: 0.! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 17:45:38'!
testEscenarioExtractorCintaCaja
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: CintaA.
	
	CintaA destino: Caja.
	CintaA vaciar.
	Caja vaciar.
	
	ExtractorDeCarbon extraer.
	
	CintaA transportar.
	
	Assert that: (Caja cantidadDe: 'una mena de carbon') isEqualTo: 1.
	Assert that: (CintaA cantidadDe: 'una mena de carbon') isEqualTo: 0.
	! !

Caja initializeAfterFileIn!
CintaA initializeAfterFileIn!
CintaB initializeAfterFileIn!
ExtractorDeCarbon initializeAfterFileIn!
ExtractorDeHierro initializeAfterFileIn!