"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fastBehaviouralParent` | `FASTTStatementBlock` | `statementBlock` | `FASTTWithStatements` | Behavioural entity containing the statement block.|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `parentTryStatement` | `FASTPyExceptClause` | `excepts` | `FASTPyTryStatement` | |
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `expressions` | `FASTPyExceptClause` | `parentExceptClause` | `FASTPyExpression` | |
| `statements` | `FASTTStatementBlock` | `statementContainer` | `FASTTStatement` | Statements enclosed in this block|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTPyExceptClause',
	#superclass : 'FASTPyEntity',
	#traits : 'FASTTStatementBlock',
	#classTraits : 'FASTTStatementBlock classTrait',
	#instVars : [
		'#expressions => FMMany type: #FASTPyExpression opposite: #parentExceptClause',
		'#parentTryStatement => FMOne type: #FASTPyTryStatement opposite: #excepts'
	],
	#category : 'FAST-Python-Model-Entities',
	#package : 'FAST-Python-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTPyExceptClause class >> annotation [

	<FMClass: #ExceptClause super: #FASTPyEntity>
	<package: #'FAST-Python-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTPyExceptClause >> addExpression: anObject [
	<generated>
	^ self expressions add: anObject
]

{ #category : 'accessing' }
FASTPyExceptClause >> expressions [
	"Relation named: #expressions type: #FASTPyExpression opposite: #parentExceptClause"

	<generated>
	<derived>
	^ expressions
]

{ #category : 'accessing' }
FASTPyExceptClause >> expressions: anObject [

	<generated>
	expressions value: anObject
]

{ #category : 'navigation' }
FASTPyExceptClause >> expressionsGroup [
	<generated>
	<navigation: 'Expressions'>
	^ MooseSpecializedGroup withAll: self expressions asSet
]

{ #category : 'accessing' }
FASTPyExceptClause >> parentTryStatement [
	"Relation named: #parentTryStatement type: #FASTPyTryStatement opposite: #excepts"

	<generated>
	<container>
	^ parentTryStatement
]

{ #category : 'accessing' }
FASTPyExceptClause >> parentTryStatement: anObject [

	<generated>
	parentTryStatement := anObject
]

{ #category : 'navigation' }
FASTPyExceptClause >> parentTryStatementGroup [
	<generated>
	<navigation: 'ParentTryStatement'>
	^ MooseSpecializedGroup with: self parentTryStatement
]
