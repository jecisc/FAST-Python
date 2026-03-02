"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `variable` | `FASTPyNonlocalStatement` | `nonlocalOwner` | `FASTPyVariable` | The variable scoped|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyNonlocalStatement',
	#superclass : 'FASTPyEntity',
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#instVars : [
		'#variable => FMOne type: #FASTPyVariable opposite: #nonlocalOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyNonlocalStatement class >> annotation [

	<FMClass: #NonlocalStatement super: #FASTPyEntity>
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
