"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `ifStatementOwner` | `FASTPyElifClause` | `elifClauses` | `FASTPyIfStatement` | |
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `condition` | `FASTTWithCondition` | `parentConditional` | `FASTTExpression` | The boolean condition tested|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyElifClause',
	#superclass : 'FASTPyBlock',
	#traits : 'FASTTConditionalStatement',
	#classTraits : 'FASTTConditionalStatement classTrait',
	#instVars : [
		'#ifStatementOwner => FMOne type: #FASTPyIfStatement opposite: #elifClauses'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyElifClause class >> annotation [

	<FMClass: #ElifClause super: #FASTPyBlock>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyElifClause >> ifStatementOwner [
	"Relation named: #ifStatementOwner type: #FASTPyIfStatement opposite: #elifClauses"

	<generated>
	<container>
	^ ifStatementOwner
]

{ #category : 'accessing' }
FASTPyElifClause >> ifStatementOwner: anObject [

	<generated>
	ifStatementOwner := anObject
]

{ #category : 'navigation' }
FASTPyElifClause >> ifStatementOwnerGroup [
	<generated>
	<navigation: 'IfStatementOwner'>
	^ MooseSpecializedGroup with: self ifStatementOwner
]
