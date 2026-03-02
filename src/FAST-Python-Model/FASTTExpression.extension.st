Extension { #name : 'FASTTExpression' }

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> assertOwner [
	"Relation named: #assertOwner type: #FASTPyAssertStatement opposite: #expression"

	<generated>
	<FMComment: 'The assert statement that own the expression (if it''s the case)'>
	<container>
	<derived>
	<FMProperty: #assertOwner type: #FASTPyAssertStatement opposite: #expression>
	<package: #'FAST-Python-Model'>
	^ self attributeAt: #assertOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> assertOwner: anObject [

	<generated>
	(self attributeAt: #assertOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self assertOwner.
		self attributeAt: #assertOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #assertOwner put: anObject.
		anObject expression: self ]
]

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> collectionInitializer [
	"Relation named: #collectionInitializers type: #FASTPyList opposite: #initializers"

	<generated>
	<FMComment: 'The owner of the expression'>
	<container>
	<FMProperty: #collectionInitializer type: #FASTPyList opposite: #initializers>
	<package: #'FAST-Python-Model'>
	^ self attributeAt: #collectionInitializer ifAbsent: [ nil ]
]

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> collectionInitializer: anObject [

	<generated>
	self attributeAt: #collectionInitializer put: (FMMultivalueLink on: self update: #initializers from: self collectionInitializer to: anObject).
]

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> deleteOwner [
	"Relation named: #deleteOwner type: #FASTPyDeleteStatement opposite: #expression"

	<generated>
	<FMComment: 'The delete statement that own the expression (if it''s the case)'>
	<container>
	<derived>
	<FMProperty: #deleteOwner type: #FASTPyDeleteStatement opposite: #expression>
	<package: #'FAST-Python-Model'>
	^ self attributeAt: #deleteOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> deleteOwner: anObject [

	<generated>
	(self attributeAt: #deleteOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self deleteOwner.
		self attributeAt: #deleteOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #deleteOwner put: anObject.
		anObject expression: self ]
]

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> parentComparisonOperator [
	"Relation named: #parentComparisonOperator type: #FASTPyComparisonOperator opposite: #operands"

	<generated>
	<FMComment: 'Parent comparison expression of which I am.'>
	<container>
	<FMProperty: #parentComparisonOperator type: #FASTPyComparisonOperator opposite: #operands>
	<package: #'FAST-Python-Model'>
	^ self attributeAt: #parentComparisonOperator ifAbsent: [ nil ]
]

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> parentComparisonOperator: anObject [

	<generated>
	self attributeAt: #parentComparisonOperator put: (FMMultivalueLink on: self update: #operands from: self parentComparisonOperator to: anObject).
]

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> parentUnaryOperator [
	"Relation named: #parentUnaryOperator type: #FASTPyTUnaryOperator opposite: #argument"

	<generated>
	<FMComment: 'Parent unary operator in which I am.'>
	<container>
	<derived>
	<FMProperty: #parentUnaryOperator type: #FASTPyTUnaryOperator opposite: #argument>
	<package: #'FAST-Python-Model'>
	^ self attributeAt: #parentUnaryOperator ifAbsent: [ nil ]
]

{ #category : '*FAST-Python-Model-accessing' }
FASTTExpression >> parentUnaryOperator: anObject [

	<generated>
	(self attributeAt: #parentUnaryOperator ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self parentUnaryOperator.
		self attributeAt: #parentUnaryOperator put: anObject.
		otherSide argument: nil ]
	ifNotNil: [ 
		self attributeAt: #parentUnaryOperator put: anObject.
		anObject argument: self ]
]
