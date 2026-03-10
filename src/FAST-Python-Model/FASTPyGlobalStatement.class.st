"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `variables` | `FASTPyGlobalStatement` | `globalOwner` | `FASTPyVariable` | The variables scoped|



"
Class {
	#name : 'FASTPyGlobalStatement',
	#superclass : 'FASTPyStatement',
	#instVars : [
		'#variables => FMMany type: #FASTPyVariable opposite: #globalOwner'
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

{ #category : 'adding' }
FASTPyGlobalStatement >> addVariable: anObject [
	<generated>
	^ self variables add: anObject
]

{ #category : 'accessing' }
FASTPyGlobalStatement >> variables [
	"Relation named: #variables type: #FASTPyVariable opposite: #globalOwner"

	<generated>
	<FMComment: 'The variables scoped'>
	<derived>
	^ variables
]

{ #category : 'accessing' }
FASTPyGlobalStatement >> variables: anObject [

	<generated>
	variables value: anObject
]

{ #category : 'navigation' }
FASTPyGlobalStatement >> variablesGroup [
	<generated>
	<navigation: 'Variables'>
	^ MooseSpecializedGroup withAll: self variables asSet
]
