"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTPyAwait` | `parentAwait` | `FASTPyExpression` | |



"
Class {
	#name : 'FASTPyAwait',
	#superclass : 'FASTPyStatement',
	#instVars : [
		'#expression => FMOne type: #FASTPyExpression opposite: #parentAwait'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyAwait class >> annotation [

	<FMClass: #Await super: #FASTPyStatement>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyAwait >> expression [
	"Relation named: #expression type: #FASTPyExpression opposite: #parentAwait"

	<generated>
	^ expression
]

{ #category : 'accessing' }
FASTPyAwait >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : 'navigation' }
FASTPyAwait >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
