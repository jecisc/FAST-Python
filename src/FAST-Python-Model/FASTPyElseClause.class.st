"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fastBehaviouralParent` | `FASTTStatementBlock` | `statementBlock` | `FASTTWithStatements` | Behavioural entity containing the statement block.|
| `ifStatementOwner` | `FASTPyElseClause` | `elseClause` | `FASTPyTWithElseClause` | |
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
	#name : 'FASTPyElseClause',
	#superclass : 'FASTPyEntity',
	#traits : 'FASTTStatementBlock',
	#classTraits : 'FASTTStatementBlock classTrait',
	#instVars : [
		'#ifStatementOwner => FMOne type: #FASTPyTWithElseClause opposite: #elseClause'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyElseClause class >> annotation [

	<FMClass: #ElseClause super: #FASTPyEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyElseClause >> ifStatementOwner [
	"Relation named: #ifStatementOwner type: #FASTPyTWithElseClause opposite: #elseClause"

	<generated>
	<container>
	<derived>
	^ ifStatementOwner
]

{ #category : 'accessing' }
FASTPyElseClause >> ifStatementOwner: anObject [

	<generated>
	ifStatementOwner := anObject
]

{ #category : 'navigation' }
FASTPyElseClause >> ifStatementOwnerGroup [
	<generated>
	<navigation: 'IfStatementOwner'>
	^ MooseSpecializedGroup with: self ifStatementOwner
]
