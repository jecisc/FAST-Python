"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentString` | `FASTPyInterpolation` | `interpolations` | `FASTPyString` | |



"
Class {
	#name : 'FASTPyInterpolation',
	#superclass : 'FASTPyEntity',
	#instVars : [
		'#parentString => FMOne type: #FASTPyString opposite: #interpolations'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyInterpolation class >> annotation [

	<FMClass: #Interpolation super: #FASTPyEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyInterpolation >> parentString [
	"Relation named: #parentString type: #FASTPyString opposite: #interpolations"

	<generated>
	<container>
	^ parentString
]

{ #category : 'accessing' }
FASTPyInterpolation >> parentString: anObject [

	<generated>
	parentString := anObject
]

{ #category : 'navigation' }
FASTPyInterpolation >> parentStringGroup [
	<generated>
	<navigation: 'ParentString'>
	^ MooseSpecializedGroup with: self parentString
]
