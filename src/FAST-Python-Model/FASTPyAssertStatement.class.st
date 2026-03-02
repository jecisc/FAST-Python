"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTPyAssertStatement` | `assertOwner` | `FASTTExpression` | The expression asserted|



"
Class {
	#name : 'FASTPyAssertStatement',
	#superclass : 'FASTPyStatement',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyAssertStatement class >> annotation [

	<FMClass: #AssertStatement super: #FASTPyStatement>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyAssertStatement >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #assertOwner"

	<generated>
	<FMComment: 'The expression asserted'>
	<FMProperty: #expression type: #FASTTExpression opposite: #assertOwner>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTPyAssertStatement >> expression: anObject [

	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide assertOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject assertOwner: self ]
]

{ #category : 'navigation' }
FASTPyAssertStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
