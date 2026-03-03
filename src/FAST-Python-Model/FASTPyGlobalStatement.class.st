"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `variable` | `FASTPyGlobalStatement` | `globalOwner` | `FASTPyVariable` | The variable scoped|



"
Class {
	#name : 'FASTPyGlobalStatement',
	#superclass : 'FASTPyStatement',
	#instVars : [
		'#variable => FMOne type: #FASTPyVariable opposite: #globalOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyGlobalStatement class >> annotation [

	<FMClass: #GlobalStatement super: #FASTPyStatement>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyGlobalStatement >> variable [
	"Relation named: #variable type: #FASTPyVariable opposite: #globalOwner"

	<generated>
	<FMComment: 'The variable scoped'>
	^ variable
]

{ #category : 'accessing' }
FASTPyGlobalStatement >> variable: anObject [

	<generated>
	variable := anObject
]

{ #category : 'navigation' }
FASTPyGlobalStatement >> variableGroup [
	<generated>
	<navigation: 'Variable'>
	^ MooseSpecializedGroup with: self variable
]
