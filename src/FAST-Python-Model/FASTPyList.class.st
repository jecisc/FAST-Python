"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentAsPatternTarget` | `FASTPyTAsPatternTarget` | `target` | `FASTPyAsPattern` | |



"
Class {
	#name : 'FASTPyList',
	#superclass : 'FASTPyCollectionInitializer',
	#traits : 'FASTPyTAsPatternTarget',
	#classTraits : 'FASTPyTAsPatternTarget classTrait',
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
