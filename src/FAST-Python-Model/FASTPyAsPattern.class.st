"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentWithClauseItem` | `FASTPyTWithStatementItem` | `items` | `FASTPyWithStatement` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `source` | `FASTPyAsPattern` | `parentAsPatternSource` | `FASTPyTAsPatternSource` | |
| `target` | `FASTPyAsPattern` | `parentAsPatternTarget` | `FASTPyTAsPatternTarget` | |



"
Class {
	#name : 'FASTPyAsPattern',
	#superclass : 'FASTPyEntity',
	#traits : 'FASTPyTWithStatementItem',
	#classTraits : 'FASTPyTWithStatementItem classTrait',
	#instVars : [
		'#source => FMOne type: #FASTPyTAsPatternSource opposite: #parentAsPatternSource',
		'#target => FMOne type: #FASTPyTAsPatternTarget opposite: #parentAsPatternTarget'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyAsPattern class >> annotation [

	<FMClass: #AsPattern super: #FASTPyEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyAsPattern >> source [
	"Relation named: #source type: #FASTPyTAsPatternSource opposite: #parentAsPatternSource"

	<generated>
	^ source
]

{ #category : 'accessing' }
FASTPyAsPattern >> source: anObject [

	<generated>
	source := anObject
]

{ #category : 'navigation' }
FASTPyAsPattern >> sourceGroup [
	<generated>
	<navigation: 'Source'>
	^ MooseSpecializedGroup with: self source
]

{ #category : 'accessing' }
FASTPyAsPattern >> target [
	"Relation named: #target type: #FASTPyTAsPatternTarget opposite: #parentAsPatternTarget"

	<generated>
	^ target
]

{ #category : 'accessing' }
FASTPyAsPattern >> target: anObject [

	<generated>
	target := anObject
]

{ #category : 'navigation' }
FASTPyAsPattern >> targetGroup [
	<generated>
	<navigation: 'Target'>
	^ MooseSpecializedGroup with: self target
]
