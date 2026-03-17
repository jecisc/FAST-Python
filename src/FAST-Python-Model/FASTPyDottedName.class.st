"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentCaseClause` | `FASTPyTPattern` | `pattern` | `FASTPyCaseClause` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `identifiers` | `String` | nil | The elements separated by a .|

"
Class {
	#name : 'FASTPyDottedName',
	#superclass : 'FASTPyEntity',
	#traits : 'FASTPyTPattern',
	#classTraits : 'FASTPyTPattern classTrait',
	#instVars : [
		'#identifiers => FMProperty'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyDottedName class >> annotation [

	<FMClass: #DottedName super: #FASTPyEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyDottedName >> identifiers [

	<FMProperty: #identifiers type: #String>
	<generated>
	<multivalued>
	<FMComment: 'The elements separated by a .'>
	^ identifiers
]

{ #category : 'accessing' }
FASTPyDottedName >> identifiers: anObject [
	<generated>
	identifiers := anObject
]
