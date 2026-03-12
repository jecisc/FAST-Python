"
In Python a collection (list or dictionary) splat is the unpacking of a collection in a call or in the definition of another definition like `[ *list , 4 ]` or `func(*list)`

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expression` | `FASTPyCollectionSplat` | `parentSplat` | `FASTPyTCanBeSplatExpression` | |



"
Class {
	#name : 'FASTPyCollectionSplat',
	#superclass : 'FASTPyExpression',
	#instVars : [
		'#expression => FMOne type: #FASTPyTCanBeSplatExpression opposite: #parentSplat'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyCollectionSplat class >> annotation [

	<FMClass: #CollectionSplat super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyCollectionSplat >> expression [
	"Relation named: #expression type: #FASTPyTCanBeSplatExpression opposite: #parentSplat"

	<generated>
	^ expression
]

{ #category : 'accessing' }
FASTPyCollectionSplat >> expression: anObject [

	<generated>
	expression := anObject
]

{ #category : 'navigation' }
FASTPyCollectionSplat >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
