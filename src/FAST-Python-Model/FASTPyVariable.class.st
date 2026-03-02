"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `globalOwner` | `FASTPyVariable` | `variable` | `FASTPyGlobalStatement` | The global statement defining my scope (if it's the case)|
| `nonlocalOwner` | `FASTPyVariable` | `variable` | `FASTPyNonlocalStatement` | The global statement defining my scope (if it's the case)|



"
Class {
	#name : 'FASTPyVariable',
	#superclass : 'FASTPyStructuralEntity',
	#instVars : [
		'#globalOwner => FMOne type: #FASTPyGlobalStatement opposite: #variable',
		'#nonlocalOwner => FMOne type: #FASTPyNonlocalStatement opposite: #variable'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyVariable class >> annotation [

	<FMClass: #Variable super: #FASTPyStructuralEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyVariable >> globalOwner [
	"Relation named: #globalOwner type: #FASTPyGlobalStatement opposite: #variable"

	<generated>
	<FMComment: 'The global statement defining my scope (if it''s the case)'>
	<container>
	<derived>
	^ globalOwner
]

{ #category : 'accessing' }
FASTPyVariable >> globalOwner: anObject [

	<generated>
	globalOwner := anObject
]

{ #category : 'navigation' }
FASTPyVariable >> globalOwnerGroup [
	<generated>
	<navigation: 'GlobalOwner'>
	^ MooseSpecializedGroup with: self globalOwner
]

{ #category : 'accessing' }
FASTPyVariable >> nonlocalOwner [
	"Relation named: #nonlocalOwner type: #FASTPyNonlocalStatement opposite: #variable"

	<generated>
	<FMComment: 'The global statement defining my scope (if it''s the case)'>
	<container>
	<derived>
	^ nonlocalOwner
]

{ #category : 'accessing' }
FASTPyVariable >> nonlocalOwner: anObject [

	<generated>
	nonlocalOwner := anObject
]

{ #category : 'navigation' }
FASTPyVariable >> nonlocalOwnerGroup [
	<generated>
	<navigation: 'NonlocalOwner'>
	^ MooseSpecializedGroup with: self nonlocalOwner
]
