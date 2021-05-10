!classDefinition: #Caja category: 'Factorio'!
DenotativeObject subclass: #Caja
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Caja class' category: 'Factorio'!
Caja class
	instanceVariableNames: 'contenido'!

!Caja class methodsFor: 'as yet unclassified' stamp: 'EF 5/10/2021 12:57:10'!
agregarElementos: coleccionDeElementos
	^contenido addAll: coleccionDeElementos.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'EF 5/9/2021 13:11:43'!
cantidadDe: unElemento
	^contenido count: [ :cadaElemento | cadaElemento = unElemento ].! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'EF 5/10/2021 13:14:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new)).! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 17:37:47'!
vaciar
	contenido _ OrderedCollection new.! !


!classDefinition: #CintaA category: 'Factorio'!
DenotativeObject subclass: #CintaA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaA class' category: 'Factorio'!
CintaA class
	instanceVariableNames: 'destino contenido'!

!CintaA class methodsFor: 'as yet unclassified' stamp: 'EF 5/10/2021 12:56:59'!
agregarElementos: coleccionDeElementos
	^contenido addAll: coleccionDeElementos.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'EF 5/9/2021 13:11:48'!
cantidadDe: unElemento
	^contenido count: [ :cadaElemento | cadaElemento = unElemento ].! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'EF 5/6/2021 19:41:07'!
destino: unDestino 
	destino _ unDestino.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'EF 5/10/2021 13:14:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := Caja.
	contenido := ((OrderedCollection new)).! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'EF 5/9/2021 12:59:17'!
transportar
	destino agregarElementos: contenido.
	self vaciar.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 17:30:16'!
vaciar
	contenido _ OrderedCollection new.! !


!classDefinition: #CintaB category: 'Factorio'!
DenotativeObject subclass: #CintaB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaB class' category: 'Factorio'!
CintaB class
	instanceVariableNames: 'destino contenido'!

!CintaB class methodsFor: 'as yet unclassified' stamp: 'EF 5/10/2021 12:57:05'!
agregarElementos: coleccionDeElementos
	^contenido addAll: coleccionDeElementos.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'EF 5/9/2021 13:11:53'!
cantidadDe: unElemento
	^contenido count: [ :cadaElemento | cadaElemento = unElemento ].! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'EF 5/6/2021 19:40:55'!
destino: unDestino 
	destino _ unDestino.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'EF 5/10/2021 13:14:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := CintaA.
	contenido := ((OrderedCollection new)).! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'EF 5/9/2021 12:57:09'!
transportar
	destino agregarElementos: contenido.
	self vaciar.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:14:17'!
vaciar
	contenido _ OrderedCollection new.! !


!classDefinition: #ExtractorDeCarbon category: 'Factorio'!
DenotativeObject subclass: #ExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeCarbon class' category: 'Factorio'!
ExtractorDeCarbon class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'EF 5/9/2021 22:30:49'!
agregarEnergia: energiaExtra
	energiaActual _ energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'EF 5/9/2021 22:30:54'!
conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas
	^ Array new: cantidadDeMenas withAll: 'una mena de carbon'! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:49'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'EF 5/9/2021 13:02:27'!
depositarMenasEnDestino: cantidadDeMenas 
	^destino agregarElementos: (self conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas).! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:14:33'!
destino: unDestino 
	destino _ unDestino.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'EF 5/9/2021 22:31:26'!
energiaActual
	^energiaActual.
! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:31:29'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'EF 5/9/2021 13:02:07'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas _ self menasAExtraerSegunEnergiaActual.
	energiaConsumida _ self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^self depositarMenasEnDestino: cantidadDeMenas.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'EF 5/10/2021 13:14:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
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


!classDefinition: #ExtractorDeHierro category: 'Factorio'!
DenotativeObject subclass: #ExtractorDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeHierro class' category: 'Factorio'!
ExtractorDeHierro class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/9/2021 22:31:51'!
agregarEnergia: energiaExtra
	energiaActual _ energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/9/2021 22:31:56'!
conjuntoDeMenasDeHierroCantidad: cantidadDeMenas
	^ Array new: cantidadDeMenas withAll: 'una mena de hierro'! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 17:49:37'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/9/2021 12:57:09'!
depositarMenasEnDestino: cantidadDeMenas 
	^destino agregarElementos: (self conjuntoDeMenasDeHierroCantidad: cantidadDeMenas).! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 18:15:09'!
destino: unDestino 
	destino _ unDestino.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/9/2021 22:32:04'!
energiaActual
	^energiaActual.
! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/8/2021 17:51:11'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/9/2021 13:01:11'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas _ self menasAExtraerSegunEnergiaActual.
	energiaConsumida _ self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^self depositarMenasEnDestino: cantidadDeMenas.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'EF 5/10/2021 13:14:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
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


!classDefinition: #PruebasDeExtractorDeCarbon category: 'Factorio'!
DenotativeObject subclass: #PruebasDeExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeExtractorDeCarbon class' category: 'Factorio'!
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


!classDefinition: #PruebasDeExtractorDeHierro category: 'Factorio'!
DenotativeObject subclass: #PruebasDeExtractorDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeExtractorDeHierro class' category: 'Factorio'!
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


!classDefinition: #PruebasDeFactorio category: 'Factorio'!
DenotativeObject subclass: #PruebasDeFactorio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeFactorio class' category: 'Factorio'!
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

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'EF 5/9/2021 13:14:04'!
testEscenarioExtractorCaja
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	
	ExtractorDeCarbon destino: Caja.
	
	Caja vaciar.
	
	ExtractorDeCarbon extraer.
	
	Assert that: (Caja cantidadDe: 'una mena de carbon') isEqualTo: 1.
	Assert that: (CintaA cantidadDe: 'una mena de carbon') isEqualTo: 0.! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'EF 5/9/2021 13:13:39'!
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