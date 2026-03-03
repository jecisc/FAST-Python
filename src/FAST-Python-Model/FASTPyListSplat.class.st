"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `iterable` | `FASTPyListSplat` | `listSplatOwner` | `FASTPyExpression` | The iterable to unpack. Can be a collection, a call, an attribute access or a subscript.|



"
Class {
	#name : 'FASTPyListSplat',
	#superclass : 'FASTPyExpression',
	#instVars : [
		'#iterable => FMOne type: #FASTPyExpression opposite: #listSplatOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyListSplat class >> annotation [

	<FMClass: #ListSplat super: #FASTPyExpression>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyListSplat >> iterable [
	"Relation named: #iterable type: #FASTPyExpression opposite: #listSplatOwner"

	<generated>
	<FMComment: 'The iterable to unpack. Can be a collection, a call, an attribute access or a subscript.'>
	^ iterable
]

{ #category : 'accessing' }
FASTPyListSplat >> iterable: anObject [

	<generated>
	iterable := anObject
]

{ #category : 'navigation' }
FASTPyListSplat >> iterableGroup [
	<generated>
	<navigation: 'Iterable'>
	^ MooseSpecializedGroup with: self iterable
]
