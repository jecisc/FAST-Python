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
| `variable` | `FASTPyGlobalStatement` | `globalOwner` | `FASTPyVariable` | The variable scoped|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyGlobalStatement',
	#superclass : 'FASTPyExpression',
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#instVars : [
		'#variable => FMOne type: #FASTPyVariable opposite: #globalOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyGlobalStatement class >> annotation [

	<FMClass: #GlobalStatement super: #FASTPyExpression>
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
