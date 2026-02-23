"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argument` | `FASTPyNotOperator` | `parentNotOperator` | `FASTTExpression` | Expression to negate.|



"
Class {
	#name : 'FASTPyNotOperator',
	#superclass : 'FASTPyOperator',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyNotOperator class >> annotation [

	<FMClass: #NotOperator super: #FASTPyOperator>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyNotOperator >> argument [
	"Relation named: #argument type: #FASTTExpression opposite: #parentNotOperator"

	<generated>
	<FMComment: 'Expression to negate.'>
	<FMProperty: #argument type: #FASTTExpression opposite: #parentNotOperator>
	^ self attributeAt: #argument ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTPyNotOperator >> argument: anObject [

	<generated>
	(self attributeAt: #argument ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self argument.
		self attributeAt: #argument put: anObject.
		otherSide parentNotOperator: nil ]
	ifNotNil: [ 
		self attributeAt: #argument put: anObject.
		anObject parentNotOperator: self ]
]

{ #category : 'navigation' }
FASTPyNotOperator >> argumentGroup [
	<generated>
	<navigation: 'Argument'>
	^ MooseSpecializedGroup with: self argument
]
