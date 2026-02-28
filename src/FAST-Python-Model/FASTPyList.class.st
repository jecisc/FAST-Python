"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `initializers` | `FASTPyTCollectionInitializer` | `collectionInitializers` | `FASTTExpression` | Each initializer defines one element.|



"
Class {
	#name : 'FASTPyList',
	#superclass : 'FASTPyCollectionInitializer',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyList class >> annotation [

	<FMClass: #List super: #FASTPyCollectionInitializer>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]
