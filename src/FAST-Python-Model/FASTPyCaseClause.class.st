"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fastBehaviouralParent` | `FASTTStatementBlock` | `statementBlock` | `FASTTWithStatements` | Behavioural entity containing the statement block.|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `parentMatchStatement` | `FASTPyCaseClause` | `cases` | `FASTPyMatchStatement` | |
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
	#name : 'FASTPyCaseClause',
	#superclass : 'FASTPyEntity',
	#traits : 'FASTTStatementBlock',
	#classTraits : 'FASTTStatementBlock classTrait',
	#instVars : [
		'#parentMatchStatement => FMOne type: #FASTPyMatchStatement opposite: #cases'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyCaseClause class >> annotation [

	<FMClass: #CaseClause super: #FASTPyEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTPyCaseClause >> parentMatchStatement [
	"Relation named: #parentMatchStatement type: #FASTPyMatchStatement opposite: #cases"

	<generated>
	<container>
	^ parentMatchStatement
]

{ #category : 'accessing' }
FASTPyCaseClause >> parentMatchStatement: anObject [

	<generated>
	parentMatchStatement := anObject
]

{ #category : 'navigation' }
FASTPyCaseClause >> parentMatchStatementGroup [
	<generated>
	<navigation: 'ParentMatchStatement'>
	^ MooseSpecializedGroup with: self parentMatchStatement
]
