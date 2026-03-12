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
	#superclass : 'FASTPyCollectionSplat',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyListSplat class >> annotation [

	<FMClass: #ListSplat super: #FASTPyCollectionSplat>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]
