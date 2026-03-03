"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTPyAssertStatement` | `assertOwner` | `FASTPyExpression` | The expression asserted|



"
Class {
	#name : 'FASTPyAssertStatement',
	#superclass : 'FASTPyStatement',
	#instVars : [
		'#expression => FMOne type: #FASTPyExpression opposite: #assertOwner'
	],
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
	"Relation named: #expression type: #FASTPyExpression opposite: #assertOwner"

	<generated>
	<FMComment: 'The expression asserted'>
	^ expression
]

{ #category : 'accessing' }
FASTPyAssertStatement >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : 'navigation' }
FASTPyAssertStatement >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
