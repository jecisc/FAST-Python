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
| `condition` | `FASTTConditionalStatement` | `parentConditionalStatement` | `FASTTExpression` | The boolean condition tested|
| `thenBlock` | `FASTPyIfStatement` | `ifStatementOwner` | `FASTPyBlock` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyIfStatement',
	#superclass : 'FASTPyStatement',
	#traits : 'FASTTConditionalStatement',
	#classTraits : 'FASTTConditionalStatement classTrait',
	#instVars : [
		'#thenBlock => FMOne type: #FASTPyBlock opposite: #ifStatementOwner'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyIfStatement class >> annotation [

	<FMClass: #IfStatement super: #FASTPyStatement>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyIfStatement >> thenBlock [
	"Relation named: #thenBlock type: #FASTPyBlock opposite: #ifStatementOwner"

	<generated>
	^ thenBlock
]

{ #category : 'accessing' }
FASTPyIfStatement >> thenBlock: anObject [

	<generated>
	thenBlock := anObject
]

{ #category : 'navigation' }
FASTPyIfStatement >> thenBlockGroup [
	<generated>
	<navigation: 'ThenBlock'>
	^ MooseSpecializedGroup with: self thenBlock
]
