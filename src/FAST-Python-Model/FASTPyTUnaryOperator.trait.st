"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argument` | `FASTPyTUnaryOperator` | `parentUnaryOperator` | `FASTTExpression` | Expression influanced by the unary operator..|



"
Trait {
	#name : 'FASTPyTUnaryOperator',
	#category : 'FAST-Python-Model-Traits',
	#package : 'FAST-Python-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTPyTUnaryOperator classSide >> annotation [

	<FMClass: #TUnaryOperator super: #Object>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyTUnaryOperator >> argument [
	"Relation named: #argument type: #FASTTExpression opposite: #parentUnaryOperator"

	<generated>
	<FMComment: 'Expression influanced by the unary operator..'>
	<FMProperty: #argument type: #FASTTExpression opposite: #parentUnaryOperator>
	^ self attributeAt: #argument ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTPyTUnaryOperator >> argument: anObject [

	<generated>
	(self attributeAt: #argument ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self argument.
		self attributeAt: #argument put: anObject.
		otherSide parentUnaryOperator: nil ]
	ifNotNil: [ 
		self attributeAt: #argument put: anObject.
		anObject parentUnaryOperator: self ]
]

{ #category : 'navigation' }
FASTPyTUnaryOperator >> argumentGroup [
	<generated>
	<navigation: 'Argument'>
	^ MooseSpecializedGroup with: self argument
]
