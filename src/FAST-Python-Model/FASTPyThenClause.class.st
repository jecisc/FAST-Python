"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fastBehaviouralParent` | `FASTTStatementBlock` | `statementBlock` | `FASTTWithStatements` | Behavioural entity containing the statement block.|
| `ifStatementOwner` | `FASTPyThenClause` | `thenClause` | `FASTPyIfStatement` | |
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `statements` | `FASTTStatementBlock` | `statementContainer` | `FASTTStatement` | Statements enclosed in this block|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyThenClause',
	#superclass : 'FASTPyEntity',
	#traits : 'FASTTStatementBlock',
	#classTraits : 'FASTTStatementBlock classTrait',
	#instVars : [
		'#ifStatementOwner => FMOne type: #FASTPyIfStatement opposite: #thenClause'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyThenClause class >> annotation [

	<FMClass: #ThenClause super: #FASTPyEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyThenClause >> ifStatementOwner [
	"Relation named: #ifStatementOwner type: #FASTPyIfStatement opposite: #thenClause"

	<generated>
	<container>
	<derived>
	^ ifStatementOwner
]

{ #category : 'accessing' }
FASTPyThenClause >> ifStatementOwner: anObject [

	<generated>
	ifStatementOwner := anObject
]

{ #category : 'navigation' }
FASTPyThenClause >> ifStatementOwnerGroup [
	<generated>
	<navigation: 'IfStatementOwner'>
	^ MooseSpecializedGroup with: self ifStatementOwner
]
