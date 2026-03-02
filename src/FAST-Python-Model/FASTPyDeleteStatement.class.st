"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTPyDeleteStatement` | `deleteOwner` | `FASTTExpression` | The expression to apply the delete on|



"
Class {
	#name : 'FASTPyDeleteStatement',
	#superclass : 'FASTPyStatement',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyDeleteStatement class >> annotation [

	<FMClass: #DeleteStatement super: #FASTPyStatement>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyDeleteStatement >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #deleteOwner"

	<generated>
	<FMComment: 'The expression to apply the delete on'>
	<FMProperty: #expression type: #FASTTExpression opposite: #deleteOwner>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTPyDeleteStatement >> expression: anObject [

	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide deleteOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject deleteOwner: self ]
]

{ #category : 'navigation' }
FASTPyDeleteStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
