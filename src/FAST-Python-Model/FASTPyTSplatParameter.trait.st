"
I represent a parameter that is a list or dictionary splat.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `target` | `FASTPyTSplatParameter` | `parentSplatParameter` | `FASTPyTSplatParameterTarget` | |



"
Trait {
	#name : 'FASTPyTSplatParameter',
	#instVars : [
		'#target => FMOne type: #FASTPyTSplatParameterTarget opposite: #parentSplatParameter'
	],
	#category : 'FAST-Python-Model-Traits',
	#package : 'FAST-Python-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTPyTSplatParameter classSide >> annotation [

	<FMClass: #TSplatParameter super: #Object>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyTSplatParameter >> target [
	"Relation named: #target type: #FASTPyTSplatParameterTarget opposite: #parentSplatParameter"

	<generated>
	^ target
]

{ #category : 'accessing' }
FASTPyTSplatParameter >> target: anObject [

	<generated>
	target := anObject
]

{ #category : 'navigation' }
FASTPyTSplatParameter >> targetGroup [
	<generated>
	<navigation: 'Target'>
	^ MooseSpecializedGroup with: self target
]
