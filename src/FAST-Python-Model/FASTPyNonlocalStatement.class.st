"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `variable` | `FASTPyNonlocalStatement` | `nonlocalOwner` | `FASTPyVariable` | The variable scoped|



"
Class {
	#name : 'FASTPyNonlocalStatement',
	#superclass : 'FASTPyStatement',
	#instVars : [
		'#variable => FMOne type: #FASTPyVariable opposite: #nonlocalOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyNonlocalStatement class >> annotation [

	<FMClass: #NonlocalStatement super: #FASTPyStatement>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyNonlocalStatement >> variable [
	"Relation named: #variable type: #FASTPyVariable opposite: #nonlocalOwner"

	<generated>
	<FMComment: 'The variable scoped'>
	^ variable
]

{ #category : 'accessing' }
FASTPyNonlocalStatement >> variable: anObject [

	<generated>
	variable := anObject
]

{ #category : 'navigation' }
FASTPyNonlocalStatement >> variableGroup [
	<generated>
	<navigation: 'Variable'>
	^ MooseSpecializedGroup with: self variable
]
