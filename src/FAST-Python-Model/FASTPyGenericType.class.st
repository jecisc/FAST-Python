"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentType` | `FASTPyTTypeContent` | `content` | `FASTPyType` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeParameters` | `FASTPyTWithTypeParameters` | `parentWithTypeParameters` | `FASTPyType` | |



"
Class {
	#name : 'FASTPyGenericType',
	#superclass : 'FASTPyEntity',
	#traits : 'FASTPyTTypeContent + FASTPyTWithTypeParameters',
	#classTraits : 'FASTPyTTypeContent classTrait + FASTPyTWithTypeParameters classTrait',
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyGenericType class >> annotation [

	<FMClass: #GenericType super: #FASTPyEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]
